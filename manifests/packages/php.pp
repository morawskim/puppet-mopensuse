class mopensuse::packages::php (
  $ensure = 'present'
) {

  $apache_user = 'wwwrun'
  $apache_group = 'www'

  include mopensuse::zypper::repositories::server_php_extensions
  include mopensuse::zypper::repositories::morawskim
  include mopensuse::config::php

  package { ['php7', 'php7-fpm', 'php7-mysql', 'php7-ldap', 'php7-soap', 'php7-pgsql',
    'php7-phar', 'php7-devel', 'php7-readline', 'php7-curl', 'php7-intl', 'php7-gettext',
    'php7-xsl', 'php7-zlib', 'php7-xmlwriter', 'php7-bcmath', 'php7-sockets', 'php7-pcntl',
    'php7-ctype', 'php7-gd', 'php7-xmlreader', 'php7-ssh2', 'php7-zip', 'php7-ftp',
    'php7-iconv', 'php7-fileinfo', 'php7-tokenizer', 'php7-exif']:
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::server_php_extensions'],
    notify  => Service['php-fpm']
  }

  service { 'php-fpm':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    require    => [ Package['php7-fpm'], File['/etc/php7/fpm/php-fpm.conf'] ]
  }

  file { '/etc/php7/fpm/php-fpm.conf':
    ensure  => present,
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    content => template("${module_name}/php/php-fpm.conf.erb"),
    notify  => [ Service['php-fpm'] ]
  }

  package { 'php7-redis':
    ensure  => $ensure,
    require => [ Package['php7'], Class['mopensuse::zypper::repositories::morawskim'] ],
    notify  => Service['php-fpm']
  }

  package { 'php7-xdebug':
    ensure  => $ensure,
    require => [ Package['php7'], Class['mopensuse::zypper::repositories::server_php_extensions'] ],
    notify  => Service['php-fpm']
  }
}
