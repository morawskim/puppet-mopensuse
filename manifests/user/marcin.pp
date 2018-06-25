class mopensuse::user::marcin (
  $username,
  $user_home_path,
  $password,
  $realname,
  $ssh_keys = {},
) {

  include mopensuse::packages::gui::adobe_source_code_pro_fonts

  mopensuse::user::account { $username:
    username      => $username,
    user_home_dir => $user_home_path,
    password      => pw_hash($password, 'SHA-512', 'salt'),
    realname      => $realname,
    sshkeys       => $ssh_keys
  }

  mopensuse::user::config::symlink { 'pam_limits':
    path   => '/etc/security/limits.d/mmo.conf',
    target => '/home/marcin/.config/pam_limits.conf',
    owner  => $username,
    group  => $username,
  }

  mopensuse::user::config::symlink { 'mysql':
    path   => '/etc/my.cnf.d/mmo.cnf',
    target => '/home/marcin/.config/mysqld_mmo.cnf',
    owner  => $username,
    group  => $username,
    mode   => '0600',
  }
}
