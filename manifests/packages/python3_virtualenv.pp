class mopensuse::packages::python3_virtualenv (
  $ensure = 'present'
) {
  include mopensuse::zypper::repositories::devel_languages_python

  package { 'python3-virtualenv':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::devel_languages_python'],
  }
}
