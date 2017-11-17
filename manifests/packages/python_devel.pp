class mopensuse::packages::python_devel($ensure = 'present') {

  package {['python-devel']:
    ensure => $ensure,
  }
}
