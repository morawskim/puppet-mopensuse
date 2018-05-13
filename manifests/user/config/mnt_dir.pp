define mopensuse::user::config::mnt_dir (
  $user,
  $user_home_path
) {

  file { "${user_home_path}/mnt":
    ensure => directory,
    mode   => '0750',
    owner  => $user,
    group  => $user,
  }
}
