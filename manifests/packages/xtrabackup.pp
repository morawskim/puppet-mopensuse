class mopensuse::packages::xtrabackup($ensure = 'present') {

  package {'xtrabackup':
    ensure          => $ensure,
  }
}