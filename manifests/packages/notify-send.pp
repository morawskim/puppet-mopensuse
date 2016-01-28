class mopensuse::packages::notify-send {
  
  package {['libnotify-tools']:
    ensure => present
  }
  
}