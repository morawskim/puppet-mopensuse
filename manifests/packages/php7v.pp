class mopensuse::packages::php7v {

  include mopensuse::zypper::repositories::morawskim
  include mopensuse::packages::php

  $phpname = 'php7'
  $service_name = "${phpname}-fpm"
  $phpfpm_prefix = "/opt/php/${phpname}"
  $pool_name = "${phpname}"
  $pool_dir = "${phpfpm_prefix}/etc/php7/fpm/pool.d"
  $pool_listen_owner = 'wwwrun'
  $pool_listen_group = 'www'
  $pool_listen_mode  = '0660'

  package {['php7', 'php7-fpm', 'php7-mysql', 'php7-ldap', 'php7-soap', 'php7-iconv',
    'php7-pgsql', 'php7-phar', 'php7-devel', 'php7-readline', 'php7-curl',
    'php7-mbstring', 'php7-json', 'php7-intl', 'php7-gettext', 'php7-xsl', 'php7-zlib',
    'php7-xmlwriter', 'php7-bcmath', 'php7-sockets', 'php7-pcntl', 'php7-ctype', 'php7-gd',
    'php7-xmlreader', 'php7-zip', 'php7-fileinfo', 'php7-tokenizer', 'php7-exif',
    'php7-mcrypt', 'php7-ftp'
]:
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

  mopensuse::define::php_fpm {$phpname:
    config_dir                     => "${phpfpm_prefix}/etc/php7/fpm",
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