class mopensuse::packages::susepaste (
  $ensure = 'present'
) {

  package { ['susepaste']:
    ensure => $ensure,
  }
}
