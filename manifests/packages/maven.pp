class mopensuse::packages::maven($ensure = 'present') {
  
include mopensuse::zypper::repositories::devel_tools_building 
  
  package {'maven':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::devel_tools_building']
  }

}