class mopensuse::zypper::repositories::multimedia_apps(
    $enabled = 1
) {

  include mopensuse::zypper::refresh

  $gpg_key = "http://download.opensuse.org/repositories/multimedia:/apps/openSUSE_${::operatingsystemrelease}/repodata/repomd.xml.key"

  zypprepo {'multimedia_apps':
    baseurl      => "http://download.opensuse.org/repositories/multimedia:/apps/openSUSE_${::operatingsystemrelease}/",
    enabled      => $enabled,
    autorefresh  => 1,
    descr        => "Multimedia Applications (openSUSE_${::operatingsystemrelease})",
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
