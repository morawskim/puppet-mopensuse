define mopensuse::user::config::kde4 (
  $user,
  $user_home_path
) {
  
  file {"${user_home_path}/.kde4":
    ensure  => directory,
    source  => "puppet:///modules/dot/marcin/kde4dot",
    recurse => 'remote', #we dont want delete unmanaged files from a directory
    owner   => $user,
    group   => $user,
    mode    => "0750",
    backup  => false,
    require => Mopensuse::User::Account[$user]
  }

}
