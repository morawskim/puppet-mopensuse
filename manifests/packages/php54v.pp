class mopensuse::packages::php54v {

  include mopensuse::zypper::repositories::morawskim
  include mopensuse::packages::php

  $phpname = 'php54v'
  $service_name = "${phpname}-fpm"
  $phpfpm_prefix = "/opt/php/${phpname}"
  $pool_name = "${phpname}"
  $pool_dir = "${phpfpm_prefix}/etc/php5/fpm/pool.d"
  $pool_listen_owner = 'wwwrun'
  $pool_listen_group = 'www'
  $pool_listen_mode  = '0660'

  package {['php54v', 'php54v-fpm', 'php54v-mysql', 'php54v-ldap', 'php54v-soap',
    'php54v-pgsql', 'php54v-phar', 'php54v-devel', 'php54v-readline', 'php54v-xdebug',
    'php54v-curl', 'php54v-mbstring', 'php54v-json', 'php54v-intl', 'php54v-gettext',
    'php54v-xsl', 'php54v-zlib', 'php54v-xmlwriter', 'php54v-bcmath', 'php54v-sockets',
    'php54v-pcntl', php54v-ctype, 'php54v-gd', 'php54v-xmlreader', 'php54v-zip',
    'php54v-iconv', 'php54v-fileinfo', 'php54v-tokenizer', 'php54v-exif',
    'php54v-mcrypt', 'php54v-ftp',
]:
    ensure  => present,
    require => Class['mopensuse::zypper::repositories::morawskim'],
    notify  => Service[$service_name]
  }

  file {'/opt/php/php54v/etc/php5/conf.d/custom.ini':
    ensure  => present,
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    source  => "puppet:///modules/${module_name}/php/php-custom.ini",
    notify  => [ Service[$service_name] ],
    require => Package['php54v']
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
    require                        => Package['php54v-fpm']
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