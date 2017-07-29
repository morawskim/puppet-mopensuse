class mopensuse::zypper::repositories::security_privacy(
    $enabled = 1
) {

  if $::operatingsystemrelease > 13.2 {
    $dist_key = "openSUSE_Leap_${::operatingsystemrelease}"
  } else {
    $dist_key = "openSUSE_${::operatingsystemrelease}"
  }
  include mopensuse::zypper::refresh

  $gpg_key = "http://download.opensuse.org/repositories/security:/privacy/${dist_key}/repodata/repomd.xml.key"

  zypprepo {'security_privacy':
    baseurl      => "http://download.opensuse.org/repositories/security:/privacy/${dist_key}",
    enabled      => $enabled,
    autorefresh  => 1,
    descr        => "Crypto applications and utilities (${dist_key})",
    gpgcheck     => 1,
    gpgkey       => $gpg_key,
    type         => 'rpm-md',
    notify       => Class['mopensuse::zypper::refresh']
  }

  rpmkey {'E3DBD3CD':
    ensure  => present,
    source  => $gpg_key,
    before  => Zypprepo['security_privacy']
  }
}
