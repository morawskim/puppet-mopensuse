class mopensuse::account (
  $username,
  $user_home_path,
  $password,
  $ssh_keys = {},
  $realname = ''
) {

  file {"${user_home_path}/projekty":
    ensure  => directory,
    mode    => '0750',
    owner   => $username,
    group   => $username,
    require => Mopensuse::User::Account[$username]
  }
  
  mopensuse::user::account {$username:
    username      => $username,
    user_home_dir => $user_home_path,
    password      => pw_hash($password, 'SHA-512', 'salt'), 
    realname      => $realname,
    sshkeys       => $ssh_keys
  }
  
  $profile_dir   = "${user_home_path}/.profile.d"
  $profile_file  = "${user_home_path}/.profile"
  
  file_line {"${user_home_path}/.profile load_scripts":
    path    => $profile_file,
    line    => "test -d ${profile_dir} && for scriptname in ${profile_dir}/*.bash; do test -r \$scriptname && source \$scriptname && unset scriptname; done",
    require => [ File[$profile_dir], File[$profile_file] ]
  }
  
  file {$profile_file:
    path   => $profile_file,
    ensure => present
  }
  
  file {$profile_dir:
    ensure  => directory,
  #  source  => "puppet:///modules/dot/.profile.d",
  #  recurse => 'remote', #we dont want delete unmanaged files from a directory
    owner   => $username,
    group   => $username,
    mode    => "0750",
    backup  => false,
    require => Mopensuse::User::Account[$username]
  }
}