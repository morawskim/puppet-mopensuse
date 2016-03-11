class mopensuse::packages::php53v {
  
  include mopensuse::zypper::repositories::morawskim
  
  package {['php53m', 'php53m-fpm', 'php53m-mysql', 'php53m-ldap', 'php53m-soap', 
    'php53m-pgsql', 'php53m-phar', 'php53m-devel', 'php53m-readline', 'php53m-xdebug', 
    'php53m-curl', 'php53m-mbstring', 'php53m-json', 'php53m-intl', 'php53m-gettext',
    'php53m-xsl', 'php53m-zlib', 'php53m-xmlwriter', 'php53m-bcmath', 'php53m-sockets',
    'php53m-pcntl']:
    ensure  => present,
    require => Class['mopensuse::zypper::repositories::morawskim'],
    notify  => Service['php-fpm']
  }
  
  file {'/opt/php/php53/etc/php5/conf.d/custom.ini':
    ensure  => present,
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    source  => "puppet:///modules/${module_name}/php/php-custom.ini",
    notify  => [ Service['php-fpm'] ],
    require => Package['php53m']
  }
}