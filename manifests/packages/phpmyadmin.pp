class mopensuse::packages::phpmyadmin (
  $ensure = 'present'
) {
  include mopensuse::packages::phpmyadminbase
  #package {'phpMyAdmin':
  #  ensure => $ensure,
  #}

  host { 'phpmyadmin.test':
    ensure       => present,
    ip           => '127.0.0.1',
    host_aliases => ['www.phpmyadmin.test']
  }

  file { '/etc/apache2/vhosts.d/phpmyadmin.test.conf':
    ensure  => present,
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    source  => "puppet:///modules/${module_name}/phpMyAdmin/vhost.conf",
    require => [ Package['apache2'], Class['::phpmyadmin'] ],
    notify  => Service['apache2']
  }

  file { '/etc/phpMyAdmin/config.inc.php.org':
    ensure  => present,
    mode    => '0640',
    owner   => 'root',
    group   => 'root',
    source  => "puppet:///modules/${module_name}/phpMyAdmin/config.backup.php",
    require => Class['::phpmyadmin'],
  }

  phpmyadmin::server { 'workstation':
    blowfish_key     => 'oowah7Chiu7ohKeieiwee3Ae',
    resource_collect => false,
    apache_group     => 'www',
    require          => Class['::phpmyadmin']
  }

  phpmyadmin::servernode { 'localhost:3306':
    myserver_name => '127.0.0.1',
    verbose_name  => 'localhost 3306',
    server_group  => 'default',
    user          => '',
    myserver_port => 3306
  }

  phpmyadmin::servernode { 'localhost:3307':
    myserver_name => '127.0.0.1',
    verbose_name  => 'localhost 3307',
    server_group  => 'default',
    user          => '',
    myserver_port => 3307
  }

  phpmyadmin::servernode { 'localhost:3308':
    myserver_name => '127.0.0.1',
    verbose_name  => 'localhost 3308',
    server_group  => 'default',
    user          => '',
    myserver_port => 3308
  }
}
