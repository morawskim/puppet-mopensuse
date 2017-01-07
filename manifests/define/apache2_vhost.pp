define mopensuse::define::apache2_vhost(
    $server_name,
    $document_root,
    $vhost_path     = $name,
    $serveraliases  = [],
    $server_admin   = 'marcin@morawskim.pl',
    $custom_config  = [],
    $php_fpm_socket = undef,
    $vhost_aliases  = [],
    $enable_phpinfo_alias = true,
    $vhost_setenv = ['MMO_DEV 1'],
    $vhost_proxy_pass = [],
    $timeout        = 60,
) {
    include mopensuse::services::apache2

    validate_string($server_name)
    validate_absolute_path($document_root)
    validate_absolute_path($vhost_path)
    validate_array($serveraliases)
    validate_string($server_admin)
    validate_array($custom_config)
    validate_array($vhost_aliases)
    validate_array($vhost_setenv)
    validate_array($vhost_proxy_pass)
    validate_bool($enable_phpinfo_alias)
    if $php_fpm_socket {
      validate_absolute_path($php_fpm_socket)
    }

    if $enable_phpinfo_alias {
      $phpifno_alias = [
        {'alias' => '/phpinfo', 'path' => '/srv/www/htdocs/phpinfo.php'}
      ]
      $aliases = concat($vhost_aliases, $phpifno_alias)
    } else {
      $aliases = $vhost_aliases
    }


    $setenv = $vhost_setenv
    $proxy_pass = $vhost_proxy_pass
    $server_timeout = $timeout

    file { $vhost_path:
        ensure  => present,
        owner   => 'root',
        group   => 'root',
        mode    => '644',
        content => template("${module_name}/apache2/vhost-fpm.erb"),
        notify  => Class['mopensuse::services::apache2']
    }
}
