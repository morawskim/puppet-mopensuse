class mopensuse::user::rpm (
    $username,
    $user_home_path,
    $password,
    $realname,
    
    $ssh_keys = {},
) {
    mopensuse::user::account {$username:
        username      => $username,
        user_home_dir => $user_home_path,
        password      => pw_hash($password, 'SHA-512', 'salt'), 
        realname      => $realname,
        sshkeys       => $ssh_keys
    }

    file {"$user_home_path/.rpmmacros":
        content => hiera('rpmmacros')
    }
}
