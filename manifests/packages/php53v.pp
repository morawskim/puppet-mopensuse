class mopensuse::packages::php53v {

  include mopensuse::zypper::repositories::morawskim
  include mopensuse::packages::php

  $phpname = 'php53'
  $service_name = "${phpname}m-fpm"
  $phpfpm_prefix = "/opt/php/${phpname}"
  $pool_name = "${phpname}"
  $pool_dir = "${phpfpm_prefix}/etc/php5/fpm/pool.d"
  $pool_listen_owner = 'wwwrun'
  $pool_listen_group = 'www'
  $pool_listen_mode  = '0660'

  package {['php53m', 'php53m-fpm', 'php53m-mysql', 'php53m-ldap', 'php53m-soap', 
    'php53m-pgsql', 'php53m-phar', 'php53m-devel', 'php53m-readline', 'php53m-xdebug', 
    'php53m-curl', 'php53m-mbstring', 'php53m-json', 'php53m-intl', 'php53m-gettext',
    'php53m-xsl', 'php53m-zlib', 'php53m-xmlwriter', 'php53m-bcmath', 'php53m-sockets',
    'php53m-pcntl', 'php53m-ctype', 'php53m-gd', 'php53m-xmlreader', 'php53m-zip',
    'php53m-iconv', 'php53m-fileinfo', 'php53m-tokenizer', 'php53m-exif']:
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