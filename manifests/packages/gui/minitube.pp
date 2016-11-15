class mopensuse::packages::gui::minitube {

  include mopensuse::zypper::repositories::multimedia_apps

  package {'minitube':
    ensure  => present,
    require => Class['mopensuse::zypper::repositories::multimedia_apps']
  }
}

 
