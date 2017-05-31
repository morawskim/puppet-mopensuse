class mopensuse::packages::apachetop($ensure = 'present') {
  
  include mopensuse::zypper::repositories::server_monitoring 
  
  package {'apachetop':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::server_monitoring']
  }

}