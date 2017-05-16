class mopensuse::zypper::repositories::server_mail(
    $enabled = 1
) {

  if $::operatingsystemrelease > 13.2 {
    $dist_key = "openSUSE_Leap_${::operatingsystemrelease}"
  } else {
    $dist_key = "openSUSE_${::operatingsystemrelease}"
  }
  include mopensuse::zypper::refresh

  $gpg_key = "http://download.opensuse.org/repositories/server:/mail/${dist_key}/repodata/repomd.xml.key"

  zypprepo {'server_mail':
    baseurl      => "http://download.opensuse.org/repositories/server:/mail/${dist_key}/",
    enabled      => $enabled,
    autorefresh  => 1,
    descr        => "Email services (${dist_key})",
    gpgcheck     => 1,
    gpgkey       => $gpg_key,
    type         => 'rpm-md',
    notify       => Class['mopensuse::zypper::refresh']
  }

  rpmkey {'367FE7FC':
    ensure  => present,
    source  => $gpg_key,
    before  => Zypprepo['server_mail']
  }
}
