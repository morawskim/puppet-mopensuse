class mopensuse::packages::stunnel($ensure = 'present') {

  package {'stunnel':
    ensure => $ensure,
  }
}
