class mopensuse::packages::wget (
  $ensure = 'present'
) {

  package { ['wget']:
    ensure => $ensure,
  }
}
