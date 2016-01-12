class mopensuse::packages::php {
  
  $apache_user  = 'wwwrun'
  $apache_group = 'www'

  include mopensuse::zypper::repositories::server_php_extensions
  include mopensuse::zypper::repositories::morawskim
  
  package {['php5', 'php5-fpm', 'php5-mysql', 'php5-ldap', 'php5-soap', 'php5-pgsql',
    'php5-phar', 'php5-devel', 'php5-readline', 'php5-curl', 'php5-intl', 'php5-gettext']:
    ensure => present,
    notify  => Service['php-fpm']
  }

  service {'php-fpm':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    require    => [ Package['php5-fpm'], File['/etc/php5/fpm/php-fpm.conf'] ]
  }
  

  file {'/etc/php5/fpm/php-fpm.conf':
    ensure  => present,
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    content => template("${module_name}/php/php-fpm.conf.erb"),
    notify  => [ Service['php-fpm'] ]
  }
  
  file {'/etc/php5/conf.d/custom.ini':
    ensure  => present,
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    source  => "puppet:///modules/${module_name}/php/php-custom.ini",
    notify  => [ Service['php-fpm'] ],
    require => Package['php5']
  }
  
  file {'/srv/www/htdocs/phpinfo.php':
    ensure  => present,
    mode    => '0644',
    owner   => $apache_user,
    group   => $apache_group,
    source  => "puppet:///modules/${module_name}/php/phpinfo.php",    
  }

  package {'php5-redis':
    ensure  => present,
    require => [ Package['php5'], Class['mopensuse::zypper::repositories::morawskim'] ],
    notify  => Service['php-fpm']
  }
  
  package {'php5-xdebug':
    ensure => present,
    require => [ Package['php5'], Class['mopensuse::zypper::repositories::server_php_extensions'] ],
    notify  => Service['php-fpm']
  }
}