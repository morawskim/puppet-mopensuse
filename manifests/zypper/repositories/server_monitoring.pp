class mopensuse::zypper::repositories::server_monitoring {
  
  include mopensuse::zypper::refresh
  
  $gpg_key = "http://download.opensuse.org/repositories/server:/monitoring/openSUSE_${::operatingsystemrelease}/repodata/repomd.xml.key"
  
  zypprepo {'server_monitoring':
    baseurl      => "http://download.opensuse.org/repositories/server:/monitoring/openSUSE_${::operatingsystemrelease}/",
    enabled      => 1,
    autorefresh  => 1,
    descr        => "Server Monitoring Software (openSUSE_${::operatingsystemrelease})",
    gpgcheck     => 1,
    gpgkey       => $gpg_key,
    type         => 'rpm-md',
    notify       => Class['mopensuse::zypper::refresh']
  }
  
  rpmkey {'EE454F98':
    ensure  => present,
    source  => $gpg_key,
    require => Zypprepo['server_monitoring']
  }
  
}