class mopensuse::packages::gui::live_usb_gui($ensure = 'present') {

  include mopensuse::zypper::repositories::education
  include mopensuse::packages::gui::kdialog

  package {'live-usb-gui':
    ensure  => $ensure,
    require => [ Class['mopensuse::zypper::repositories::education'], Class['mopensuse::packages::gui::kdialog'] ]
  }
}

