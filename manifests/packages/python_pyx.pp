class mopensuse::packages::python_pyx($ensure = 'present') {

  include mopensuse::zypper::repositories::devel-languages-python

  package {'python-pyx':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::devel-languages-python'],
  }
}
