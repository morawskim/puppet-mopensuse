class mopensuse::packages::gui::chrome {
  
  include mopensuse::zypper::repositories::google-chrome
  
  package{'google-chrome-stable':
    ensure  => present,
    require => Class['mopensuse::zypper::repositories::google-chrome'],
  }
}