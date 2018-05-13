class mopensuse::packages::python_keyring (
  $ensure = 'present'
) {

  package { ['python-keyring']:
    ensure => $ensure,
  }
}
