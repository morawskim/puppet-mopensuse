class mopensuse::packages::php54v {

  include mopensuse::zypper::repositories::morawskim
  include mopensuse::packages::php

  $phpname = 'php54'
  $service_name = "${phpname}-fpm"
  $phpfpm_prefix = "/opt/php/${phpname}"
  $pool_name = "${phpname}"
  $pool_dir = "${phpfpm_prefix}/etc/php5/fpm/pool.d"
  $pool_listen_owner = 'wwwrun'
  $pool_listen_group = 'www'
  $pool_listen_mode  = '0660'

  package {['php54', 'php54-fpm', 'php54-mysql', 'php54-ldap', 'php54-soap', 
    'php54-pgsql', 'php54-phar', 'php54-devel', 'php54-readline', 'php54-xdebug', 
    'php54-curl', 'php54-mbstring', 'php54-json', 'php54-intl', 'php54-gettext',
    'php54-xsl', 'php54-zlib', 'php54-xmlwriter', 'php54-bcmath', 'php54-sockets',
    'php54-pcntl', php54-ctype, 'php54-gd', 'php54-xmlreader', 'php54-zip',
    'php54-iconv', 'php54-fileinfo', 'php54-tokenizer', 'php54-exif',
    'php54-mcrypt', 'php54-ftp',
]:
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

  mopensuse::define::php_fpm {$phpname:
    config_dir                     => "${phpfpm_prefix}/etc/php5/fpm",
    config_name                    => 'php-fpm.conf',
    config_template_file           => 'phpfpm/php-fpm.conf.erb',
    service_name                   => $service_name,
    pool_dir                       => $pool_dir,
    pid_file                       => "/run/${phpname}-fpm.pid",
    error_log                      => "/var/log/${phpname}-fpm.log",
    syslog_ident                   => "${phpname}-fpm",
  }

  mopensuse::define::php_fpm_pool {$pool_name:
    pool_dir          => $pool_dir,
    pool_listen       => "/run/${pool_name}-fpm.sock",
    pool_listen_owner => $pool_listen_owner,
    pool_listen_group => $pool_listen_group,
    pool_listen_mode  => $pool_listen_mode,
    require           => Mopensuse::Define::Php_fpm[$phpname],
    notify            => Service[$service_name]
  }

  service {$service_name:
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    require    => [ Mopensuse::Define::Php_fpm_pool[$pool_name] ]
  }
}