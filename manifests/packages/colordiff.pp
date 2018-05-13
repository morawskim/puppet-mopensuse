class mopensuse::packages::colordiff (
  $ensure = 'present'
) {

  package { ['colordiff']:
    ensure => $ensure,
  }
}
