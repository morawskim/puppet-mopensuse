class mopensuse::zypper::repositories::server_php_extensions(
    $enabled = 1
) {

  if $::operatingsystemrelease > 13.2 {
    $dist_key = "openSUSE_Leap_${::operatingsystemrelease}"
  } else {
    $dist_key = "openSUSE_${::operatingsystemrelease}"
  }
  include mopensuse::zypper::refresh

  $gpg_key = "http://download.opensuse.org/repositories/server:/php:/extensions/${dist_key}/repodata/repomd.xml.key"

  zypprepo {'server_php_extensions':
    baseurl      => "http://download.opensuse.org/repositories/server:/php:/extensions/${dist_key}/",
    enabled      => $enabled,
    autorefresh  => 1,
    descr        => "PHP extensions (${dist_key})",
    gpgcheck     => 1,
    gpgkey       => $gpg_key,
    type         => 'rpm-md',
    notify       => Class['mopensuse::zypper::refresh']
  }

  rpmkey {'1AF1B065':
    ensure  => present,
    source  => $gpg_key,
    before  => Zypprepo['server_php_extensions']
  }
}