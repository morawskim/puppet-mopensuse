class mopensuse::packages::gui::redshift($ensure = 'present') {
  
  include mopensuse::zypper::repositories::x11_utilities
  
  package {'redshift':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::x11_utilities']
  }
  
}

 
