class mopensuse::packages::bind(
    $bind_listen_on = 'any'
) {
    
    include mopensuse::packages::bind-utils
    include mopensuse::packages::augeas
    include mopensuse::packages::firewall
    
    package { 'bind':
        ensure => present
    }
    
    file { "/etc/named.conf":
        ensure  => present,
        owner   => 'root',
        group   => 'named',
        mode    => '644',
        content => template("${module_name}/bind/named.conf.erb"),
        require => Package['bind'],
        notify  => Service['named']
    }
    
    file { "/etc/named.d/db.172.22":
        ensure  => present,
        owner   => 'root',
        group   => 'named',
        mode    => '740',
        source  => "puppet:///modules/${module_name}/bind/db.172.22",
        notify  => Service['named'],
        require => Package['bind']
    }
    
    file{"/etc/named.d/db.mmo.dev":
        ensure  => present,
        owner   => 'root',
        group   => 'named',
        mode    => '740',
        source  => "puppet:///modules/${module_name}/bind/db.mmo.dev",
        notify  => Service['named'],
        require => Package['bind']
    }
    
    file{"/etc/named.d/include-dev-zone.conf":
        ensure  => present,
        owner   => 'root',
        group   => 'named',
        mode    => '740',
        source  => "puppet:///modules/${module_name}/bind/include-dev-zone.conf",
        notify  => Service['named'],
        require => Package['bind']
    }
    
    file { "/etc/named.d/db.development":
        ensure  => present,
        owner   => 'root',
        group   => 'named',
        mode    => '740',
        replace => false,
        source  => "puppet:///modules/${module_name}/bind/db.development",
        notify  => Service['named'],
        require => Package['bind']
    }

    service { 'named':
        ensure     => 'running',
        enable     => true,
        hasrestart => true,
        hasstatus  => true,
        require    => Package['bind']
    }
    
    augeas { "/files/etc/sysconfig/named/NAMED_CONF_INCLUDE_FILES":
        changes => [
        'set /files/etc/sysconfig/named/NAMED_CONF_INCLUDE_FILES \'"include-dev-zone.conf"\''
        ],
        require => [ Class["mopensuse::packages::augeas"], Package['bind'] ],
        notify  => Service['named']
    }
    
    exec { 'firewall_open_dns_port':
        command => 'sysconf_addword /etc/sysconfig/SuSEfirewall2 FW_CONFIGURATIONS_EXT bind',
        unless  => 'grep "bind" /etc/sysconfig/SuSEfirewall2 | grep "FW_CONFIGURATIONS_EXT"',
        path    => ['/usr/sbin', '/usr/bin'],
        require => [ Package['bind'], Class['mopensuse::packages::firewall'] ]
    }
}