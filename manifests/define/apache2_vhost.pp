define mopensuse::define::apache2_vhost(
    $server_name,
    $document_root,
    $vhost_path = $name,
    $server_alias = "www.$server_name",
    $server_admin = 'marcin@morawskim.pl'
) {
    validate_string($server_name)
    validate_absolute_path($document_root)
    validate_absolute_path($vhost_path)
    validate_string($server_alias)
    validate_string($server_admin)

    file { $vhost_path:
        ensure  => present,
        owner   => 'root',
        group   => 'root',
        mode    => '644',
        content => template("${module_name}/apache2/vhost-fpm.erb"),
    }
}
