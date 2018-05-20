class mopensuse::packages::php55v (
  $ensure = 'present'
) {
  include mopensuse::zypper::repositories::morawskim
  include mopensuse::packages::php
  include mopensuse::config::php55v
  include mopensuse::services::php55v

  $phpname = 'php55v'
  $service_name = "${phpname}-fpm"
  $phpfpm_prefix = "/opt/php/${phpname}"
  $pool_name = $phpname
  $pool_dir = "${phpfpm_prefix}/etc/php5/fpm/pool.d"
  $pool_listen_owner = 'wwwrun'
  $pool_listen_group = 'www'
  $pool_listen_mode = '0660'

  package { ['php55v', 'php55v-fpm', 'php55v-mysql', 'php55v-ldap', 'php55v-soap',
    'php55v-pgsql', 'php55v-phar', 'php55v-devel', 'php55v-readline', 'php55v-xdebug',
    'php55v-redis', 'php55v-curl', 'php55v-mbstring', 'php55v-json', 'php55v-intl',
    'php55v-gettext', 'php55v-xsl', 'php55v-zlib', 'php55v-xmlwriter', 'php55v-bcmath',
    'php55v-sockets', 'php55v-iconv', 'php55v-fileinfo', 'php55v-tokenizer', 'php55v-exif',
    'php55v-pcntl', php55v-ctype, 'php55v-gd', 'php55v-xmlreader', 'php55v-zip',
    'php55v-mcrypt', 'php55v-ftp'
  ]:
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::morawskim'],
  }

  mopensuse::define::php_fpm { $phpname:
    config_dir           => "${phpfpm_prefix}/etc/php5/fpm",
    config_name          => 'php-fpm.conf',
    config_template_file => 'phpfpm/php-fpm.conf.erb',
    service_name         => $service_name,
    pool_dir             => $pool_dir,
    pid_file             => "/run/${phpname}-fpm.pid",
    error_log            => "/var/log/${phpname}-fpm.log",
    syslog_ident         => "${phpname}-fpm",
    require              => Package['php55v-fpm'],
    notify               => Class['mopensuse::services::php55v']
  }

  mopensuse::define::php_fpm_pool { $pool_name:
    pool_dir          => $pool_dir,
    pool_listen       => "/run/${pool_name}-fpm.sock",
    pool_listen_owner => $pool_listen_owner,
    pool_listen_group => $pool_listen_group,
    pool_listen_mode  => $pool_listen_mode,
    require           => Mopensuse::Define::Php_fpm[$phpname],
    notify               => Class['mopensuse::services::php55v']
  }
}
