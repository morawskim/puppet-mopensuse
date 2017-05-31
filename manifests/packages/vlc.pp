class mopensuse::packages::vlc($ensure = 'present') {
  
  package {'vlc':
    ensure => $ensure,
  }
  
}