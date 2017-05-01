class mopensuse::zypper::repositories::network(
    $enabled = 1
) {

  if $::operatingsystemrelease > 13.2 {
    $dist_key = "openSUSE_Leap_${::operatingsystemrelease}"
  } else {
    $dist_key = "openSUSE_${::operatingsystemrelease}"
  }
  include mopensuse::zypper::refresh

  $gpg_key = "http://download.opensuse.org/repositories/network/${dist_key}/repodata/repomd.xml.key"

  zypprepo {'network':
    baseurl      => "http://download.opensuse.org/repositories/network/${dist_key}/",
    enabled      => $enabled,
    autorefresh  => 1,
    descr        => "Networking services and related tools (${dist_key})",
    gpgcheck     => 1,
    gpgkey       => $gpg_key,
    type         => 'rpm-md',
    notify       => Class['mopensuse::zypper::refresh']
  }

  rpmkey {'17280DDF':
    ensure  => present,
    source  => $gpg_key,
    before  => Zypprepo['network']
  }
}
