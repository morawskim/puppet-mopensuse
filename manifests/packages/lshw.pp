class mopensuse::packages::lshw {
  
  include mopensuse::zypper::repositories::hardware
  
  package {['lshw']:
    ensure  => present,
    require => Class['mopensuse::zypper::repositories::hardware']
  }
  
}