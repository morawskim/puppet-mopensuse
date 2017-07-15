class mopensuse::zypper::repositories::security(
    $enabled = 1
) {

  if $::operatingsystemrelease > 13.2 {
    $dist_key = "openSUSE_Leap_${::operatingsystemrelease}"
  } else {
    $dist_key = "openSUSE_${::operatingsystemrelease}"
  }
  include mopensuse::zypper::refresh

  $gpg_key = "http://download.opensuse.org/repositories/security/${dist_key}/repodata/repomd.xml.key"

  zypprepo {'security':
    baseurl      => "http://download.opensuse.org/repositories/security/${dist_key}/",
    enabled      => $enabled,
    autorefresh  => 1,
    descr        => "Security tools (${dist_key})",
    gpgcheck     => 1,
    gpgkey       => $gpg_key,
    type         => 'rpm-md',
    notify       => Class['mopensuse::zypper::refresh']
  }

  if ! defined(Rpmkey['EE3D166A']) {
    rpmkey {'EE3D166A':
        ensure  => present,
        source  => $gpg_key,
        before  => Zypprepo['security']
    }
  }
}
