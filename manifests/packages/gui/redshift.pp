class mopensuse::packages::gui::redshift {
  
  include mopensuse::zypper::repositories::x11_utilities
  
  package {'redshift':
    ensure  => present,
    require => Class['mopensuse::zypper::repositories::x11_utilities']
  }
  
}

 
