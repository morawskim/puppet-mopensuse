class mopensuse::packages::php56v {
  
  include mopensuse::zypper::repositories::morawskim
  
  package {['php56', 'php56-fpm', 'php56-mysql', 'php56-ldap', 'php56-soap', 
    'php56-pgsql', 'php56-phar', 'php56-devel', 'php56-readline', 'php56-xdebug', 
    'php56-redis', 'php56-curl', 'php56-mbstring', 'php56-json', 'php56-intl', 
    'php56-gettext', 'php56-xsl', 'php56-zlib', 'php56-xmlwriter', 'php56-bcmath', 'php56-sockets',
    'php56-pcntl', php56-ctype, 'php56-gd', 'php56-xmlreader']:
    ensure  => present,
    require => Class['mopensuse::zypper::repositories::morawskim'],
    notify  => Service['php-fpm']
  }
  
  file {'/opt/php/php56/etc/php5/conf.d/custom.ini':
    ensure  => present,
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    source  => "puppet:///modules/${module_name}/php/php-custom.ini",
    notify  => [ Service['php-fpm'] ],
    require => Package['php56']
  }
  
}