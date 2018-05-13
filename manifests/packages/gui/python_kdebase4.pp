class mopensuse::packages::gui::python_kdebase4 (
  $ensure = 'present'
) {

  package { 'python-kdebase4':
    ensure => $ensure,
  }
}
