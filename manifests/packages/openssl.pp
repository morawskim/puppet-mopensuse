class mopensuse::packages::openssl (
  $ensure = 'present'
) {

  package { ['openssl']:
    ensure => $ensure,
  }
}
