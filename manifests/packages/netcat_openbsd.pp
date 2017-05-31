class mopensuse::packages::netcat_openbsd($ensure = 'present') {

  package {'netcat-openbsd':
    ensure => $ensure,
  }
}
