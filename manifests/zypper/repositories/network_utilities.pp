class mopensuse::zypper::repositories::network_utilities(
    $enabled = 1
) {

  if $::operatingsystemrelease > 13.2 {
    $dist_key = "openSUSE_Leap_${::operatingsystemrelease}"
  } else {
    $dist_key = "openSUSE_${::operatingsystemrelease}"
  }
  include mopensuse::zypper::refresh

  $gpg_key = "http://download.opensuse.org/repositories/network:utilities/${dist_key}/repodata/repomd.xml.key"

  zypprepo {'network_utilities':
    baseurl      => "http://download.opensuse.org/repositories/network:utilities/${dist_key}/",
    enabled      => $enabled,
    autorefresh  => 1,
    descr        => "Network Utilities (${dist_key})",
    gpgcheck     => 1,
    gpgkey       => $gpg_key,
    type         => 'rpm-md',
    notify       => Class['mopensuse::zypper::refresh']
  }

  rpmkey {'392FFA88':
    ensure  => present,
    source  => $gpg_key,
    before  => Zypprepo['network_utilities']
  }
}
