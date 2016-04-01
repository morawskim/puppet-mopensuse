define mopensuse::user::config::owncloud (
    $user,
    $user_home_path,
    
    $owncloud_desktop_localpath,
    $owncloud_desktop_http_user,
    $owncloud_desktop_url,
    $owncloud_desktop_user
) {
    
    file {"${user_home_path}/.local/share/data/ownCloud/owncloud.cfg":
        ensure  => present,
        mode    => '0640',
        owner   => $user,
        group   => $user,
        content => template("${module_name}/owncloud/desktop_client.cfg.erb")
    }
}

