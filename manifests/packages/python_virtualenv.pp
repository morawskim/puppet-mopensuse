class mopensuse::packages::python_virtualenv($ensure = 'present') {

  include mopensuse::zypper::repositories::devel_languages_python

  package {'python-virtualenv':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::devel_languages_python'],
  }
}
