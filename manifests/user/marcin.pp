class mopensuse::user::marcin (
  $username,
  $user_home_path,
  $password,
  $realname,
  
  $git_user_name,
  $git_user_email,
  $git_diff_tool,
  
  $github_oauth_token,
  
  $ssh_keys = {},
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
  
  mopensuse::user::config::git{$username:
    user           => $username,
    user_home_path => $user_home_path,
    git_user_name  => $git_user_name,
    git_user_email => $git_user_email,
    git_diff_tool  => $git_diff_tool,
    require        => Mopensuse::User::Account[$username]
  }
  
  mopensuse::user::config::vagrant-group{$username:
    user    => $username,
    require => Mopensuse::User::Account[$username]
  }
  
  mopensuse::user::config::redshift{$username:
    kde_autostar_dir    => "${user_home_path}/.kde4/Autostart",
    require             => Mopensuse::User::Account[$username]
  }
  
  mopensuse::user::config::users-group{$username:
    user    => $username,
    require => Mopensuse::User::Account[$username]
  }
  
  mopensuse::user::config::sshfs-group{$username:
    user    => $username,
    require => Mopensuse::User::Account[$username]
  }
  
  mopensuse::user::config::composer{$username:
    user               => $username,
    require            => Mopensuse::User::Account[$username],
    composer_home      => "${user_home_path}/.composer",
    github_oauth_token => $github_oauth_token
  }
}