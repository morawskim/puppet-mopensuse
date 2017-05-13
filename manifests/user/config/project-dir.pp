define mopensuse::user::config::project-dir(
  $user,
  $user_home_path
) {
  
  file {"${user_home_path}/projekty":
    ensure  => directory,
    mode    => '0755',
    owner   => $user,
    group   => $user,
  }
  
}
