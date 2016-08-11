class mopensuse::packages::gui::shutter {

  include mopensuse::zypper::repositories::x11_utilities

  package {'shutter':
    ensure  => present,
    require => Class['mopensuse::zypper::repositories::x11_utilities']
  }
}

 
