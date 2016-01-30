class mopensuse::user::marcin (
  $username,
  $user_home_path,
  $password,
  $realname,
  $ssh_keys = {}
) {
  
  mopensuse::user::account {$username:
    username      => $username,
    user_home_dir => $user_home_path,
    password      => pw_hash($password, 'SHA-512', 'salt'), 
    realname      => $realname,
    sshkeys       => $ssh_keys
  }
  
  mopensuse::user::config::vboxusers-group{$username:
    user    => $username,
    require => Mopensuse::User::Account[$username]
  }
  
  mopensuse::user::config::disk-group{$username:
    user    => $username,
    require => Mopensuse::User::Account[$username]
  }
  
  mopensuse::user::config::profile{$username:
    user           => $username,
    user_home_path => $user_home_path,
    require        => Mopensuse::User::Account[$username]
  }
  
  mopensuse::user::config::project-dir{$username:
    user           => $username,
    user_home_path => $user_home_path,
    require        => Mopensuse::User::Account[$username]
  }
}