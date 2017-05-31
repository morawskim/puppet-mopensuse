class mopensuse::packages::gui::scrot($ensure = 'present') {
  
  include mopensuse::zypper::repositories::x11_utilities
  
  package {'scrot':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::x11_utilities']
  }
  
}

 
