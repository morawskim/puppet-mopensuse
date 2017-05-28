define mopensuse::user::config::konsole (
  $user,
  $user_home_path,
  $font
) {

  file { "$user_home_path/.local/share/konsole/__CURRENT.colorscheme":
    ensure => present,
    source => "file://$user_home_path/.local/share/konsole/Afterglow.colorscheme"
  }

  ini_setting { "[$user] konsole set colorschema name":
    ensure  => present,
    path    => "${user_home_path}/.local/share/konsole/__CURRENT.colorscheme",
    section => 'General',
    setting => 'Description',
    value   => '__CURRENT',
    require => File["$user_home_path/.local/share/konsole/__CURRENT.colorscheme"]
  }

  ini_setting { "[$user] konsole set wallpaper":
    ensure  => present,
    path    => "${user_home_path}/.local/share/konsole/__CURRENT.colorscheme",
    section => 'General',
    setting => 'Wallpaper',
    value   => '$user_home_path/Obrazy/solarized_darcula.jpg',
    require => File["$user_home_path/.local/share/konsole/__CURRENT.colorscheme"]
  }

  ini_setting { "[$user] konsole set colorScheme":
    ensure  => present,
    path    => "${user_home_path}/.local/share/konsole/Profil 1.profile",
    section => 'Appearance',
    setting => 'ColorScheme',
    value   => '__CURRENT',
  }

  ini_setting { "[$user] konsole set font":
    ensure  => present,
    path    => "${user_home_path}/.local/share/konsole/Profil 1.profile",
    section => 'Appearance',
    setting => 'Font',
    value   => $font,
  }

  ini_setting { "[$user] konsole set general name":
    ensure  => present,
    path    => "${user_home_path}/.local/share/konsole/Profil 1.profile",
    section => 'General',
    setting => 'Name',
    value   => 'Profil 1',
  }

  ini_setting { "[$user] konsole set general parent":
    ensure  => present,
    path    => "${user_home_path}/.local/share/konsole/Profil 1.profile",
    section => 'General',
    setting => 'Parent',
    value   => 'FALLBACK/',
  }
}
