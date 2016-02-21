class mopensuse::packages::gui::scrot {
  
  include mopensuse::zypper::repositories::x11_utilities
  
  package {'scrot':
    ensure  => present,
    require => Class['mopensuse::zypper::repositories::x11_utilities']
  }
  
}

 
