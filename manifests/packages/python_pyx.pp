class mopensuse::packages::python_pyx (
  $ensure = 'present'
) {
  include mopensuse::zypper::repositories::devel_languages_python

  package { 'python-pyx':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::devel_languages_python'],
  }
}
