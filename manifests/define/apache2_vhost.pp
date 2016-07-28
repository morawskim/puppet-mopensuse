define mopensuse::define::apache2_vhost(
    $server_name,
    $document_root,
    $vhost_path    = $name,
    $serveraliases = [],
    $server_admin  = 'marcin@morawskim.pl',
    $custom_config = []
) {
    validate_string($server_name)
    validate_absolute_path($document_root)
    validate_absolute_path($vhost_path)
    validate_array($serveraliases)
    validate_string($server_admin)
    validate_array($custom_config)

    file { $vhost_path:
        ensure  => present,
        owner   => 'root',
        group   => 'root',
        mode    => '644',
        content => template("${module_name}/apache2/vhost-fpm.erb"),
        notify  => Class['mopensuse::services::apache2']
    }
}
