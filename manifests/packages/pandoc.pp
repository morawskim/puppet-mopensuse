class mopensuse::packages::pandoc($ensure = 'present') {

  package {'pandoc':
    ensure          => $ensure,
  }
}
