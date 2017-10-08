class mopensuse::packages::cgit($ensure = 'present') {
  
    include mopensuse::packages::apache2
    include mopensuse::packages::augeas
    include mopensuse::packages::git_server
    include mopensuse::packages::highlight
    include mopensuse::zypper::repositories::morawskim
    
    package {'cgit':
        ensure => $ensure,
    }
    
    package {'cgit-filter-syntaxhiglight':
        ensure  => $ensure,
        require => Class['mopensuse::zypper::repositories::morawskim']
    }
  
    file {'/etc/apache2/vhosts.d/cgit.dev.conf':
        ensure  => present,
        mode    => '0744',
        owner   => 'root',
        group   => 'root',
        source  => "puppet:///modules/${module_name}/cgit/cgit.dev.vhost",
        require => [ Package['cgit'], Class['mopensuse::packages::apache2'] ],
        notify  => Class['mopensuse::services::apache2']
    }
  
    host {'cgit.dev':
        ensure       => present,
        ip           => '127.0.0.1',
        host_aliases => 'www.cgit.dev'
    }
    
    file {'/etc/cgitrc':
        ensure  => present,
        mode    => '0644',
        owner   => 'root',
        group   => 'root',
        source  => "puppet:///modules/${module_name}/cgit/cgitrc",
        require => [ Package['cgit'], Class['mopensuse::packages::highlight'] ],
        notify  => Class['mopensuse::services::apache2']
    }
    
    file {'/var/cache/cgit':
        ensure  => directory,
        mode    => '1770',
        owner   => 'root',
        group   => 'www',
        require => Class['mopensuse::services::apache2']
    }
     
}
