class mopensuse::packages::python3_devel (
  $ensure = 'present'
) {

  package { ['python3-devel']:
    ensure => $ensure,
  }
}
