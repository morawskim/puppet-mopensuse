class mopensuse::packages::dhcpd (
  $ensure = 'present'
) {

  package { ['dhcp-server']:
    ensure => $ensure,
  }

  service { 'dhcpd':
    ensure  => 'stopped',
    enable  => false,
    require => Package['dhcp-server']
  }

  service { 'dhcpd6':
    ensure  => 'stopped',
    enable  => false,
    require => Package['dhcp-server']
  }
}
