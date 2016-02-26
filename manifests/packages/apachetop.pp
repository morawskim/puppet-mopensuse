class mopensuse::packages::apachetop {
  
  include mopensuse::zypper::repositories::server_monitoring 
  
  package {'apachetop':
    ensure  => present,
    require => Class['mopensuse::zypper::repositories::server_monitoring']
  }

}