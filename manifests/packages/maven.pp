class mopensuse::packages::maven {
  
include mopensuse::zypper::repositories::devel_tools_building 
  
  package {'maven':
    ensure  => present,
    require => Class['mopensuse::zypper::repositories::devel_tools_building']
  }

}