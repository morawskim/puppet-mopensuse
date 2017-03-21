class mopensuse::packages::php56v {

  include mopensuse::zypper::repositories::morawskim
  include mopensuse::packages::php

  $phpname = 'php56'
  $service_name = "${phpname}-fpm"
  $phpfpm_prefix = "/opt/php/${phpname}"
  $pool_name = "${phpname}"
  $pool_dir = "${phpfpm_prefix}/etc/php5/fpm/pool.d"
  $pool_listen_owner = 'wwwrun'
  $pool_listen_group = 'www'
  $pool_listen_mode  = '0660'

  package {['php56', 'php56-fpm', 'php56-mysql', 'php56-ldap', 'php56-soap', 'php56-ftp',
    'php56-pgsql', 'php56-phar', 'php56-devel', 'php56-readline', 'php56-xdebug', 
    'php56-redis', 'php56-curl', 'php56-mbstring', 'php56-json', 'php56-intl', 
    'php56-gettext', 'php56-xsl', 'php56-zlib', 'php56-xmlwriter', 'php56-bcmath', 'php56-sockets',
    'php56-pcntl', php56-ctype, 'php56-gd', 'php56-xmlreader', 'php56-zip', 'php56-tokenizer',
    'php56-iconv', 'php56-fileinfo', 'php56-exif', 'php56-mcrypt']:
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