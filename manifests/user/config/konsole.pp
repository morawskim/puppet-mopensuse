define mopensuse::user::config::konsole (
  $user_home_path,
  $source_colorscheme,
  $font,
  $profile_name = 'Shell',
  $wallpaper = ''
) {

  file { "$user_home_path/.local/share/konsole/__CURRENT.colorscheme":
    ensure => present,
    source => $source_colorscheme
  }

  ini_setting { "[$user_home_path] konsole set colorschema name":
    ensure            => present,
    path              => "${user_home_path}/.local/share/konsole/__CURRENT.colorscheme",
    section           => 'General',
    setting           => 'Description',
    value             => '__CURRENT',
    key_val_separator => '=',
    require           => File["$user_home_path/.local/share/konsole/__CURRENT.colorscheme"]
  }

  ini_setting { "[$user_home_path] konsole set wallpaper":
    ensure            => present,
    path              => "${user_home_path}/.local/share/konsole/__CURRENT.colorscheme",
    section           => 'General',
    setting           => 'Wallpaper',
    value             => $wallpaper,
    key_val_separator => '=',
    require           => File["$user_home_path/.local/share/konsole/__CURRENT.colorscheme"]
  }

  ini_setting { "[$user_home_path] konsole set colorScheme":
    ensure            => present,
    path              => "${user_home_path}/.local/share/konsole/${profile_name}.profile",
    section           => 'Appearance',
    setting           => 'ColorScheme',
    value             => '__CURRENT',
    key_val_separator => '=',
  }

  ini_setting { "[$user_home_path] konsole set font":
    ensure            => present,
    path              => "${user_home_path}/.local/share/konsole/${profile_name}.profile",
    section           => 'Appearance',
    setting           => 'Font',
    value             => $font,
    key_val_separator => '=',
  }

  ini_setting { "[$user_home_path] konsole set general name":
    ensure            => present,
    path              => "${user_home_path}/.local/share/konsole/${profile_name}.profile",
    section           => 'General',
    setting           => 'Name',
    value             => $profile_name,
    key_val_separator => '=',
  }

  ini_setting { "[$user_home_path] konsole set general parent":
    ensure            => present,
    path              => "${user_home_path}/.local/share/konsole/${profile_name}.profile",
    section           => 'General',
    setting           => 'Parent',
    value             => 'FALLBACK/',
    key_val_separator => '=',
  }

  ini_setting { "[$user_home_path] konsole set profile name":
    ensure            => present,
    path              => "${user_home_path}/.config/konsolerc",
    section           => 'Desktop Entry',
    setting           => 'DefaultProfile',
    value             => "${profile_name}.profile",
    key_val_separator => '=',
  }
}
