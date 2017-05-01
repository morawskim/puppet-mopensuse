class mopensuse::zypper::repositories::server_monitoring(
    $enabled = 1
) {
  
  if $::operatingsystemrelease > 13.2 {
    $dist_key = "openSUSE_Leap_${::operatingsystemrelease}"
  } else {
    $dist_key = "openSUSE_${::operatingsystemrelease}"
  }
  include mopensuse::zypper::refresh
  
  $gpg_key = "http://download.opensuse.org/repositories/server:/monitoring/${dist_key}/repodata/repomd.xml.key"
  
  zypprepo {'server_monitoring':
    baseurl      => "http://download.opensuse.org/repositories/server:/monitoring/${dist_key}/",
    enabled      => $enabled,
    autorefresh  => 1,
    descr        => "Server Monitoring Software (${dist_key})",
    gpgcheck     => 1,
    gpgkey       => $gpg_key,
    type         => 'rpm-md',
    notify       => Class['mopensuse::zypper::refresh']
  }
  
  rpmkey {'EE454F98':
    ensure  => present,
    source  => $gpg_key,
    before  => Zypprepo['server_monitoring']
  }
  
}
