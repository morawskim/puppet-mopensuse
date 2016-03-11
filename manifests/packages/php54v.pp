class mopensuse::packages::php54v {
  
  include mopensuse::zypper::repositories::morawskim
  
  package {['php54', 'php54-fpm', 'php54-mysql', 'php54-ldap', 'php54-soap', 
    'php54-pgsql', 'php54-phar', 'php54-devel', 'php54-readline', 'php54-xdebug', 
    'php54-curl', 'php54-mbstring', 'php54-json', 'php54-intl', 'php54-gettext',
    'php54-xsl', 'php54-zlib', 'php54-xmlwriter', 'php54-bcmath', 'php54-sockets',
    'php54-pcntl']:
    ensure  => present,
    require => Class['mopensuse::zypper::repositories::morawskim'],
    notify  => Service['php-fpm']
  }
  
  file {'/opt/php/php54/etc/php5/conf.d/custom.ini':
    ensure  => present,
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    source  => "puppet:///modules/${module_name}/php/php-custom.ini",
    notify  => [ Service['php-fpm'] ],
    require => Package['php54']
  }
}