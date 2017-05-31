class mopensuse::packages::notify-send($ensure = 'present') {
  
  package {['libnotify-tools']:
    ensure => $ensure,
  }
  
}