class mopensuse::packages::lshw($ensure = 'present') {
  
  include mopensuse::zypper::repositories::hardware
  
  package {['lshw']:
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::hardware']
  }
  
}