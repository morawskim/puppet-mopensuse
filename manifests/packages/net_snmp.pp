class mopensuse::packages::net_snmp($ensure = 'present') {

  package {'net-snmp':
    ensure => $ensure,
  }
}
