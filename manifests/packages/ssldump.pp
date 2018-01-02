class mopensuse::packages::ssldump($ensure = 'present') {

  package {'ssldump':
    ensure          => $ensure,
  }
}
