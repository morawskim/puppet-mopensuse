class mopensuse::packages::php71v (
  $ensure = 'present'
) {
  include mopensuse::zypper::repositories::morawskim
  include mopensuse::zypper::repositories::server_monitoring
  include mopensuse::packages::php
  include mopensuse::config::php71v
  include mopensuse::services::php71v

  $phpname = 'php71v'
  $service_name = "${phpname}-fpm"
  $phpfpm_prefix = "/opt/php/${phpname}"
  $pool_name = $phpname
  $pool_dir = "${phpfpm_prefix}/etc/php7/fpm/pool.d"
  $pool_listen_owner = 'wwwrun'
  $pool_listen_group = 'www'
  $pool_listen_mode = '0660'

  package { ['php71v', 'php71v-fpm', 'php71v-mysql', 'php71v-ldap', 'php71v-soap', 'php71v-iconv',
    'php71v-pgsql', 'php71v-phar', 'php71v-devel', 'php71v-readline', 'php71v-curl',
    'php71v-mbstring', 'php71v-json', 'php71v-intl', 'php71v-gettext', 'php71v-xsl', 'php71v-zlib',
    'php71v-xmlwriter', 'php71v-bcmath', 'php71v-sockets', 'php71v-pcntl', 'php71v-ctype', 'php71v-gd',
    'php71v-xmlreader', 'php71v-zip', 'php71v-fileinfo', 'php71v-tokenizer', 'php71v-exif',
    'php71v-mcrypt', 'php71v-ftp'
  ]:
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::morawskim'],
  }

  package { ['php71v-xdebug', 'php71v-redis', 'php71v-imagick', 'php71v-mailparse']:
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::morawskim'],
  }

  package { ['php71v-gearman']:
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::server_monitoring'],
  }

  mopensuse::define::php_fpm { $phpname:
    config_dir           => "${phpfpm_prefix}/etc/php7/fpm",
    config_name          => 'php-fpm.conf',
    config_template_file => 'phpfpm/php-fpm.conf.erb',
    service_name         => $service_name,
    pool_dir             => $pool_dir,
    pid_file             => "/run/${phpname}-fpm.pid",
    error_log            => "/var/log/${phpname}-fpm.log",
    syslog_ident         => "${phpname}-fpm",
    require              => Package['php71v-fpm'],
    notify               => Class['mopensuse::services::php71v'],
  }

  mopensuse::define::php_fpm_pool { $pool_name:
    pool_dir          => $pool_dir,
    pool_listen       => "/run/${pool_name}-fpm.sock",
    pool_listen_owner => $pool_listen_owner,
    pool_listen_group => $pool_listen_group,
    pool_listen_mode  => $pool_listen_mode,
    require           => Mopensuse::Define::Php_fpm[$phpname],
    notify            => Class['mopensuse::services::php71v'],
  }
}
