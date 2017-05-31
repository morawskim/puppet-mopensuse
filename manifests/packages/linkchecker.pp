class mopensuse::packages::linkchecker($ensure = 'present') {

  package {'linkchecker':
    ensure => $ensure,
  }
}