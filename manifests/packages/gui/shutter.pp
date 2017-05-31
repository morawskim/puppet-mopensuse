class mopensuse::packages::gui::shutter($ensure = 'present') {

  include mopensuse::zypper::repositories::x11_utilities

  package {'shutter':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::x11_utilities']
  }
}

 
