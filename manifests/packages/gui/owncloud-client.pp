class mopensuse::packages::gui::owncloud-client  {
  
  include mopensuse::zypper::repositories::isv_owncloud_desktop
  
  package {'owncloud-client':
    ensure  => present,
    require => Class['mopensuse::zypper::repositories::isv_ownCloud_desktop']
  }
  
}

