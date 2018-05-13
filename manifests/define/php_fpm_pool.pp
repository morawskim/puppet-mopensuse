define mopensuse::define::php_fpm_pool (
  $pool_listen,
  $pool_dir,
  $pool_name                      = $title,
  $pool_template_file             = 'phpfpm/pool.conf.erb',
  $pool_user                      = 'wwwrun',
  $pool_group                     = 'www',
  $pool_listen_backlog            = undef,
  $pool_listen_owner              = undef,
  $pool_listen_group              = undef,
  $pool_listen_mode               = undef,
  $pool_listen_allowed_clients    = undef,
  $pool_pm                        = 'dynamic',
  $pool_pm_max_children           = 10,
  $pool_pm_start_servers          = 4,
  $pool_pm_min_spare_servers      = 2,
  $pool_pm_max_spare_servers      = 6,
  $pool_pm_process_idle_timeout   = undef,
  $pool_pm_max_requests           = undef,
  $pool_pm_status_path            = undef,
  $pool_ping_path                 = undef,
  $pool_ping_response             = undef,
  $pool_access_log                = undef,
  $pool_access_format             = undef,
  $pool_slowlog                   = undef,
  $pool_req_slowlog_timeout       = undef,
  $pool_req_terminate_timeout     = undef,
  $pool_rlimit_files              = undef,
  $pool_rlimit_core               = undef,
  $pool_chroot                    = undef,
  $pool_chdir                     = '/',
  $pool_catch_workers_output      = undef,
  $pool_security_limit_extensions = undef,
  $pool_env                       = {},
  $pool_php_value                 = {},
  $pool_php_flag                  = {},
  $pool_php_admin_value           = {},
  $pool_php_admin_flag            = {}
) {

  include ::phpfpm::params
  $user = $pool_user
  $group = $pool_group
  $listen = $pool_listen
  $listen_backlog = $pool_listen_backlog
  $listen_owner = $pool_listen_owner
  $listen_group = $pool_listen_group
  $listen_mode = $pool_listen_mode
  $listen_allowed_clients = $pool_listen_allowed_clients
  $pm = $pool_pm
  $pm_max_children = $pool_pm_max_children
  $pm_start_servers = $pool_pm_start_servers
  $pm_min_spare_servers = $pool_pm_min_spare_servers
  $pm_max_spare_servers = $pool_pm_max_spare_servers
  $pm_process_idle_timeout = $pool_pm_process_idle_timeout
  $pm_max_requests = $pool_pm_max_requests
  $pm_status_path = $pool_pm_status_path
  $ping_path = $pool_ping_path
  $ping_response = $pool_ping_response
  $access_log = $pool_access_log
  $access_format = $pool_access_format
  $slowlog = $pool_slowlog
  $request_slowlog_timeout = $pool_req_slowlog_timeout
  $request_terminate_timeout = $pool_req_terminate_timeout
  $rlimit_files = $pool_rlimit_files
  $rlimit_core = $pool_rlimit_core
  $chroot = $pool_chroot
  $chdir = $pool_chdir
  $catch_workers_output = $pool_catch_workers_output
  $security_limit_extensions = $pool_security_limit_extensions
  $env = $pool_env
  $php_value = $pool_php_value
  $php_flag = $pool_php_flag
  $php_admin_value = $pool_php_admin_value
  $php_admin_flag = $pool_php_admin_flag

  $pool_file_path = "${pool_dir}/${name}.conf"

  if $pm_start_servers < $pm_min_spare_servers or
    $pm_start_servers > $pm_max_spare_servers {
    fail("pm_start_servers(${pm_start_servers}) must not be less than \
      pm_min_spare_servers(${pm_min_spare_servers}) and not greater than \
      pm_max_spare_servers(${pm_max_spare_servers})")
  }

  file { $pool_file_path:
    ensure  => $ensure,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template($pool_template_file),
    #require => Class['Phpfpm::Package'],
    #notify  => Service[$service_name],
  }
}
