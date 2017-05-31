class mopensuse::packages::php53v($ensure = 'present') {

  include mopensuse::zypper::repositories::morawskim
  include mopensuse::packages::php

  $phpname = 'php53v'
  $service_name = "${phpname}-fpm"
  $phpfpm_prefix = "/opt/php/${phpname}"
  $pool_name = "${phpname}"
  $pool_dir = "${phpfpm_prefix}/etc/php5/fpm/pool.d"
  $pool_listen_owner = 'wwwrun'
  $pool_listen_group = 'www'
  $pool_listen_mode  = '0660'

  package {['php53v', 'php53v-fpm', 'php53v-mysql', 'php53v-ldap', 'php53v-soap',
    'php53v-pgsql', 'php53v-phar', 'php53v-devel', 'php53v-readline', 'php53v-xdebug',
    'php53v-curl', 'php53v-mbstring', 'php53v-json', 'php53v-intl', 'php53v-gettext',
    'php53v-xsl', 'php53v-zlib', 'php53v-xmlwriter', 'php53v-bcmath', 'php53v-sockets',
    'php53v-pcntl', 'php53v-ctype', 'php53v-gd', 'php53v-xmlreader', 'php53v-zip',
    'php53v-iconv', 'php53v-fileinfo', 'php53v-tokenizer', 'php53v-exif',
    'php53v-mcrypt', 'php53v-ftp',
]:
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::morawskim'],
    notify  => Service[$service_name]
  }

  file {'/opt/php/php53v/etc/php5/conf.d/custom.ini':
    ensure  => present,
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    source  => "puppet:///modules/${module_name}/php/php-custom.ini",
    notify  => [ Service[$service_name] ],
    require => Package['php53v']
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
    require                        => Package['php53v-fpm']
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