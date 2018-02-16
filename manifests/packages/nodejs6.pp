class mopensuse::packages::nodejs6($ensure = 'present') {

  package {'nodejs6':
    ensure => $ensure,
  }
}
