class mopensuse::packages::redis (
  $ensure = 'present'
) {

  package { 'redis':
    ensure => $ensure,
  }
}
