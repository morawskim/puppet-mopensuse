class mopensuse::packages::phpmyadmin40($ensure = 'present') {

  include mopensuse::packages::phpmyadminbase
  include mopensuse::zypper::repositories::morawskim

  package {'phpMyAdmin40':
    ensure => $ensure,
    require => Class['mopensuse::zypper::repositories::morawskim']
  }

  host {'phpmyadmin40.dev':
    ensure       => present,
    ip           => '127.0.0.1',
    host_aliases => ['www.phpmyadmin40.dev']
  }

  file {'/etc/apache2/vhosts.d/phpmyadmin40.dev.conf':
    ensure  => present,
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    source  => "puppet:///modules/${module_name}/phpMyAdmin/phpMyAdmin40.vhost",
    require => [ Package['apache2'], Class['::phpmyadmin'] ],
    notify  => Service['apache2']
  }

  phpmyadmin::server { 'workstation40':
    #blowfish_key => 'oowah7Chiu7ohKeieiwee3Ae',
    config_file      => '/etc/phpMyAdmin40/config.inc.php',
    data_dir         => '/etc/phpMyAdmin40/',
    resource_collect => false,
    apache_group     => 'www',
    package_name     => 'phpMyAdmin40',
    require => Class['::phpmyadmin']
  }

  phpmyadmin::servernode { "localhost40:3306":
    myserver_name => '127.0.0.1',
    verbose_name  => 'localhost 3306',
    server_group  => 'default',
    user          => '',
    myserver_port => 3306,
    target        => '/etc/phpMyAdmin40/config.inc.php'
  }

  phpmyadmin::servernode { "localhost40:3307":
    myserver_name => '127.0.0.1',
    verbose_name  => 'localhost 3307',
    server_group  => 'default',
    user          => '',
    myserver_port => 3307,
    target        => '/etc/phpMyAdmin40/config.inc.php'
  }

  phpmyadmin::servernode { "localhost40:3308":
    myserver_name => '127.0.0.1',
    verbose_name  => 'localhost 3308',
    server_group  => 'default',
    user          => '',
    myserver_port => 3308,
    target        => '/etc/phpMyAdmin40/config.inc.php'
  }
}
