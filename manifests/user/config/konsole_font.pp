define mopensuse::user::config::konsole_font (
  $user,
  $user_home_path,
  $font
) {
  ini_setting { "konsole Font":
    ensure  => present,
    path    => "${user_home_path}/.kde4/share/apps/konsole/Shell.profile",
    section => 'Appearance',
    setting => 'Font',
    value   => $font,
  }
}
