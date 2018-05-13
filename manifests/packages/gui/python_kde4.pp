class mopensuse::packages::gui::python_kde4 (
  $ensure = 'present'
) {

  package { 'python-kde4':
    ensure => $ensure,
  }
}
