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
}
