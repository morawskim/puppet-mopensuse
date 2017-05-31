class mopensuse::packages::offlineimap($ensure = 'present') {
  
  package {'offlineimap':
    ensure => $ensure,
  }
  
}