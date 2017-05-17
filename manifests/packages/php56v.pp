class mopensuse::packages::php56v {

  include mopensuse::zypper::repositories::morawskim
  include mopensuse::packages::php

  $phpname = 'php56v'
  $service_name = "${phpname}-fpm"
  $phpfpm_prefix = "/opt/php/${phpname}"
  $pool_name = "${phpname}"
  $pool_dir = "${phpfpm_prefix}/etc/php5/fpm/pool.d"
  $pool_listen_owner = 'wwwrun'
  $pool_listen_group = 'www'
  $pool_listen_mode  = '0660'

  package {['php56v', 'php56v-fpm', 'php56v-mysql', 'php56v-ldap', 'php56v-soap', 'php56v-ftp',
    'php56v-pgsql', 'php56v-phar', 'php56v-devel', 'php56v-readline', 'php56v-xdebug',
    'php56v-redis', 'php56v-curl', 'php56v-mbstring', 'php56v-json', 'php56v-intl',
    'php56v-gettext', 'php56v-xsl', 'php56v-zlib', 'php56v-xmlwriter', 'php56v-bcmath', 'php56v-sockets',
    'php56v-pcntl', php56v-ctype, 'php56v-gd', 'php56v-xmlreader', 'php56v-zip', 'php56v-tokenizer',
    'php56v-iconv', 'php56v-fileinfo', 'php56v-exif', 'php56v-mcrypt']:
    ensure  => present,
    require => Class['mopensuse::zypper::repositories::morawskim'],
    notify  => Service[$service_name]
  }

  file {'/opt/php/php56v/etc/php5/conf.d/custom.ini':
    ensure  => present,
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    source  => "puppet:///modules/${module_name}/php/php-custom.ini",
    notify  => [ Service[$service_name] ],
    require => Package['php56v']
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
    require                        => Package['php56v-fpm']
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