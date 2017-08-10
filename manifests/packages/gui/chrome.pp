class mopensuse::packages::gui::chrome($ensure = 'present') {
  
  include mopensuse::zypper::repositories::google-chrome
  include mopensuse::zypper::repositories::morawskim
  
  package{'google-chrome-stable':
    ensure  => present,
    require => Class['mopensuse::zypper::repositories::morawskim'],
    notify => Class['mopensuse::zypper::repositories::google-chrome']
  }
}
