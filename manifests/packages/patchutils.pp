class mopensuse::packages::patchutils($ensure = 'present') {

  package {'patchutils':
    ensure => $ensure,
  }
}
