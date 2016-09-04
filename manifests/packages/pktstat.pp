class mopensuse::packages::pktstat {

  include mopensuse::zypper::repositories::server_monitoring 

  package {'pktstat':
    ensure  => present,
    require => Class['mopensuse::zypper::repositories::server_monitoring']
  }
}