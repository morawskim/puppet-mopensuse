class mopensuse::packages::mutt (
  $ensure = 'present'
) {

  package { ['mutt']:
    ensure => $ensure,
  }
}
