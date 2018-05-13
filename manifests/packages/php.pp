class mopensuse::packages::php (
  $ensure = 'present'
) {

  $apache_user = 'wwwrun'
  $apache_group = 'www'

  include mopensuse::zypper::repositories::server_php_extensions
  include mopensuse::zypper::repositories::morawskim
  include mopensuse::config::php

  package { ['php5', 'php5-fpm', 'php5-mysql', 'php5-ldap', 'php5-soap', 'php5-pgsql',
    'php5-phar', 'php5-devel', 'php5-readline', 'php5-curl', 'php5-intl', 'php5-gettext',
    'php5-xsl', 'php5-zlib', 'php5-xmlwriter', 'php5-bcmath', 'php5-sockets', 'php5-pcntl',
    'php5-ctype', 'php5-gd', 'php5-xmlreader', 'php5-ssh2', 'php5-zip', 'php5-ftp',
    'php5-iconv', 'php5-fileinfo', 'php5-tokenizer', 'php5-exif']:
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::server_php_extensions'],
    notify  => Service['php-fpm']
  }

  service { 'php-fpm':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    require    => [ Package['php5-fpm'], File['/etc/php5/fpm/php-fpm.conf'] ]
  }

  file { '/etc/php5/fpm/php-fpm.conf':
    ensure  => present,
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    content => template("${module_name}/php/php-fpm.conf.erb"),
    notify  => [ Service['php-fpm'] ]
  }

  package { 'php5-redis':
    ensure  => $ensure,
    require => [ Package['php5'], Class['mopensuse::zypper::repositories::morawskim'] ],
    notify  => Service['php-fpm']
  }

  package { 'php5-xdebug':
    ensure  => $ensure,
    require => [ Package['php5'], Class['mopensuse::zypper::repositories::server_php_extensions'] ],
    notify  => Service['php-fpm']
  }
}
