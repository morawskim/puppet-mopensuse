define mopensuse::user::config::project-dir(
  $user,
  $user_home_path
) {
  
  file {"${user_home_path}/projekty":
    ensure  => directory,
    mode    => '0750',
    owner   => $user,
    group   => $user,
    require => Mopensuse::User::Account[$user]
  }
  
}
