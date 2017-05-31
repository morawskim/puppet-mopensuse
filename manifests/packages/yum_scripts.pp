class mopensuse::packages::yum_scripts($ensure = 'present') {

  package {'yum-scripts':
    ensure          => $ensure,
  }
}
