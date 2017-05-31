class mopensuse::packages::gui::owncloud-client($ensure = 'present')  {
  
  include mopensuse::zypper::repositories::isv_owncloud_desktop
  
  package {'owncloud-client':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::isv_ownCloud_desktop']
  }
  
}

