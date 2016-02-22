class mopensuse::packages::gui::lshw-gui {
  
  include mopensuse::zypper::repositories::hardware
  
  package {'lshw-gui':
    ensure  => present,
    require => Class['mopensuse::zypper::repositories::hardware']
  }
  
}

 
