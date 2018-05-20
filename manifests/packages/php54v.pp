class mopensuse::packages::php54v (
  $ensure = 'present'
) {
  include mopensuse::zypper::repositories::morawskim
  include mopensuse::packages::php
  include mopensuse::config::php54v
  include mopensuse::services::php54v

  $phpname = 'php54v'
  $service_name = "${phpname}-fpm"
  $phpfpm_prefix = "/opt/php/${phpname}"
  $pool_name = $phpname
  $pool_dir = "${phpfpm_prefix}/etc/php5/fpm/pool.d"
  $pool_listen_owner = 'wwwrun'
  $pool_listen_group = 'www'
  $pool_listen_mode = '0660'

  package { ['php54v', 'php54v-fpm', 'php54v-mysql', 'php54v-ldap', 'php54v-soap',
    'php54v-pgsql', 'php54v-phar', 'php54v-devel', 'php54v-readline', 'php54v-xdebug',
    'php54v-curl', 'php54v-mbstring', 'php54v-json', 'php54v-intl', 'php54v-gettext',
    'php54v-xsl', 'php54v-zlib', 'php54v-xmlwriter', 'php54v-bcmath', 'php54v-sockets',
    'php54v-pcntl', php54v-ctype, 'php54v-gd', 'php54v-xmlreader', 'php54v-zip',
    'php54v-iconv', 'php54v-fileinfo', 'php54v-tokenizer', 'php54v-exif',
    'php54v-mcrypt', 'php54v-ftp',
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
    require              => Package['php54v-fpm'],
    notify               => Class['mopensuse::services::php54v'],
  }

  mopensuse::define::php_fpm_pool { $pool_name:
    pool_dir          => $pool_dir,
    pool_listen       => "/run/${pool_name}-fpm.sock",
    pool_listen_owner => $pool_listen_owner,
    pool_listen_group => $pool_listen_group,
    pool_listen_mode  => $pool_listen_mode,
    require           => Mopensuse::Define::Php_fpm[$phpname],
    notify            => Class['mopensuse::services::php54v'],
  }
}
