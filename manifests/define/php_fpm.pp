define mopensuse::define::php_fpm (
  $phpname                     = $title,
  $config_dir                  = '/etc/php5/fpm',
  $config_name                 = 'php-fpm.conf',
  $config_template_file        = 'phpfpm/php-fpm.conf.erb',
  $service_name                = 'php5-fpm',

  $pool_dir                    = '/etc/php5/fpm/pool.d',
  $pid_file                    = '/run/php5-fpm.pid',
  $error_log                   = '/var/log/php5-fpm.log',
  $syslog_facility             = 'daemon',
  $syslog_ident                = 'php5-fpm',
  $log_level                   = 'notice',
  $emergency_restart_threshold = 0,
  $emergency_restart_interval  = 0,
  $process_control_timeout     = 0,
  $process_max                 = 0,
  $daemonize                   = 'yes',
  $rlimit_files                = undef,
  $rlimit_core                 = undef
) {

  file { "${config_dir}/${config_name}":
    ensure  => 'present',
    content => template($config_template_file),
    notify  => Service[$service_name],
  }

  file { $pool_dir:
    ensure => 'directory',
    mode   => '0755'
  }
}
