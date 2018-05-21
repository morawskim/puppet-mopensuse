class mopensuse::packages::php70v (
  $ensure = 'present'
) {
  include mopensuse::zypper::repositories::morawskim
  include mopensuse::zypper::repositories::server_monitoring
  include mopensuse::packages::php
  include mopensuse::config::php70v
  include mopensuse::services::php70v

  $phpname = 'php70v'
  $service_name = "${phpname}-fpm"
  $phpfpm_prefix = "/opt/php/${phpname}"
  $pool_name = $phpname
  $pool_dir = "${phpfpm_prefix}/etc/php7/fpm/pool.d"
  $pool_listen_owner = 'wwwrun'
  $pool_listen_group = 'www'
  $pool_listen_mode = '0660'

  package { ['php70v', 'php70v-fpm', 'php70v-mysql', 'php70v-ldap', 'php70v-soap', 'php70v-iconv',
    'php70v-pgsql', 'php70v-phar', 'php70v-devel', 'php70v-readline', 'php70v-curl',
    'php70v-mbstring', 'php70v-json', 'php70v-intl', 'php70v-gettext', 'php70v-xsl', 'php70v-zlib',
    'php70v-xmlwriter', 'php70v-bcmath', 'php70v-sockets', 'php70v-pcntl', 'php70v-ctype', 'php70v-gd',
    'php70v-xmlreader', 'php70v-zip', 'php70v-fileinfo', 'php70v-tokenizer', 'php70v-exif',
    'php70v-mcrypt', 'php70v-ftp'
  ]:
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::morawskim'],
  }

  package { ['php70v-xdebug', 'php70v-redis', 'php70v-imagick', 'php70v-mailparse']:
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::morawskim'],
  }

  package { ['php70v-gearman']:
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
    require              => Package['php70v-fpm'],
    notify               => Class['mopensuse::services::php70v'],
  }

  mopensuse::define::php_fpm_pool { $pool_name:
    pool_dir          => $pool_dir,
    pool_listen       => "/run/${pool_name}-fpm.sock",
    pool_listen_owner => $pool_listen_owner,
    pool_listen_group => $pool_listen_group,
    pool_listen_mode  => $pool_listen_mode,
    require           => Mopensuse::Define::Php_fpm[$phpname],
    notify            => Class['mopensuse::services::php70v'],
  }
}
