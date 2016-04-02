class mopensuse::packages::dhcpd {

    package {['dhcp-server']:
        ensure  => present,
    }

    service { 'dhcpd':
        ensure  => 'stopped',
        enable  => 'false',
        require => Package['dhcp-server']
    }

    service { 'dhcpd6':
        ensure  => 'stopped',
        enable  => 'false',
        require => Package['dhcp-server']
    }

}