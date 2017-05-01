class mopensuse::zypper::repositories::multimedia_apps(
    $enabled = 1
) {

  if $::operatingsystemrelease > 13.2 {
    $dist_key = "openSUSE_Leap_${::operatingsystemrelease}"
  } else {
    $dist_key = "openSUSE_${::operatingsystemrelease}"
  }
  include mopensuse::zypper::refresh

  $gpg_key = "http://download.opensuse.org/repositories/multimedia:/apps/${dist_key}/repodata/repomd.xml.key"

  zypprepo {'multimedia_apps':
    baseurl      => "http://download.opensuse.org/repositories/multimedia:/apps/${dist_key}/",
    enabled      => $enabled,
    autorefresh  => 1,
    descr        => "Multimedia Applications (${dist_key})",
    gpgcheck     => 1,
    gpgkey       => $gpg_key,
    type         => 'rpm-md',
    notify       => Class['mopensuse::zypper::refresh']
  }

  rpmkey {'3A802234':
    ensure  => present,
    source  => $gpg_key,
    before  => Zypprepo['multimedia_apps']
  }
}
