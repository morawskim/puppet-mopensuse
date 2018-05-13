class mopensuse::packages::network (
  $ensure = 'present'
) {

  package { ['nmap', 'ipcalc']:
    ensure => $ensure,
  }
}
