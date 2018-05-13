class mopensuse::packages::mytop (
  $ensure = 'present'
) {

  package { ['mytop']:
    ensure => $ensure,
  }
}
