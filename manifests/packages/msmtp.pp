class mopensuse::packages::msmtp (
  $ensure = 'present'
) {

  package { ['msmtp']:
    ensure => $ensure,
  }
}
