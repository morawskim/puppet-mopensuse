define mopensuse::user::account (
  $username,
  $user_home_dir,

  $sshkeys  = {},
  $shell    = '/bin/bash',
  $realname = '',
  $password = '',
  $groups   = [],
) {

  user { $username:
    ensure     => 'present',
    gid        => $username,
    shell      => $shell,
    home       => $user_home_dir,
    comment    => $realname,
    password   => $password,
    managehome => true,
    groups     => $groups,
    require    => Group[$username],
  }

  group { $username:
    ensure => present,
  }

  file { $user_home_dir:
    ensure  => directory,
    owner   => $username,
    group   => $username,
    mode    => '0755',
    require => [ User[$username], Group[$username] ],
  }

  file { "${user_home_dir}/.ssh":
    ensure  => directory,
    owner   => $username,
    group   => $username,
    mode    => '0700',
    require => File[$user_home_dir],
  }


  if size($sshkeys) > 0 {
    $sshkey_defaults = {
      ensure  => present,
      user    => $username,
      type    => 'ssh-rsa',
      require => [ User[$username], File["${user_home_dir}/.ssh"] ]
    }

    create_resources(ssh_authorized_key, $sshkeys, $sshkey_defaults)
  } else {
    notify { "Not set ssh keys for account ${username}": }
  }
}
