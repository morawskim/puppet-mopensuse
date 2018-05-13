class mopensuse::packages::monitoring (
  $ensure = 'present'
) {

  package { ['iotop', 'htop']:
    ensure => $ensure,
  }
}
