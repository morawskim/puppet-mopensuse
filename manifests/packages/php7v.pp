class mopensuse::packages::php7v {
  
  include mopensuse::zypper::repositories::morawskim
  
  package {['php7', 'php7-fpm', 'php7-mysql', 'php7-ldap', 'php7-soap', 
    'php7-pgsql', 'php7-phar', 'php7-devel', 'php7-readline', 'php7-curl', 
    'php7-mbstring', 'php7-json', 'php7-intl', 'php7-gettext', 'php7-xsl', 'php7-zlib',
    'php7-xmlwriter', 'php7-bcmath', 'php7-sockets', 'php7-pcntl', 'php7-ctype', 'php7-gd',
    'php7-xmlreader']:
    ensure  => present,
    require => Class['mopensuse::zypper::repositories::morawskim'],
    notify  => Service['php-fpm']
  }
  
  file{'/opt/php/php7/etc/php7/conf.d/custom.ini':
    ensure  => present,
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    source  => "puppet:///modules/${module_name}/php/php-custom.ini",
    notify  => Service['php-fpm'],
    require => Package['php7']
  }
  
}