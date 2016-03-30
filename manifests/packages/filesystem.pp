class mopensuse::packages::filesystem {
    
    package {'filesystem':
        ensure => present
    }
    
    file {'/etc/sysctl.d/40-ipforward.conf':
        ensure  => present,
        mode    => '0644',
        owner   => 'root',
        group   => 'root',
        source  => "puppet:///modules/${module_name}/sysctl/40-ipforward.conf",
        require => Package['filesystem']
    }

    augeas { "/files/etc/sysconfig/SuSEfirewall2/FW_ROUTE":
        changes => [
        'set /files/etc/sysconfig/SuSEfirewall2/FW_ROUTE \'"yes"\'',
        ],
        require => [ Package["augeas"] ]
    }
}