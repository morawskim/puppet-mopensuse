class mopensuse::packages::virtualbox (
  $ensure = 'present'
) {

  package { ['virtualbox']:
    ensure => $ensure,
  }
}
