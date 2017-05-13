define mopensuse::user::config::konsole_monokai (
  $user,
  $user_home_path
) {

  ini_setting { "konsole Background":
    ensure  => present,
    path    => "${user_home_path}/.kde4/share/apps/konsole/Monokai.colorscheme",
    section => 'Background',
    setting => 'Color',
    value   => '39,40,34',
  }

  ini_setting { "konsole BackgroundIntense":
    ensure  => present,
    path    => "${user_home_path}/.kde4/share/apps/konsole/Monokai.colorscheme",
    section => 'BackgroundIntense',
    setting => 'Color',
    value   => '104,104,104',
  }

  ini_setting { "konsole Color0":
    ensure  => present,
    path    => "${user_home_path}/.kde4/share/apps/konsole/Monokai.colorscheme",
    section => 'Color0',
    setting => 'Color',
    value   => '39,40,34',
  }

  ini_setting { "konsole Color0Intense":
    ensure  => present,
    path    => "${user_home_path}/.kde4/share/apps/konsole/Monokai.colorscheme",
    section => 'Color0Intense',
    setting => 'Color',
    value   => '104,104,104',
  }

  ini_setting { "konsole Color1":
    ensure  => present,
    path    => "${user_home_path}/.kde4/share/apps/konsole/Monokai.colorscheme",
    section => 'Color1',
    setting => 'Color',
    value   => '229,34,34',
  }

  ini_setting { "konsole Color1Intense":
    ensure  => present,
    path    => "${user_home_path}/.kde4/share/apps/konsole/Monokai.colorscheme",
    section => 'Color1Intense',
    setting => 'Color',
    value   => '229,24,24',
  }

  ini_setting { "konsole Color2":
    ensure  => present,
    path    => "${user_home_path}/.kde4/share/apps/konsole/Monokai.colorscheme",
    section => 'Color2',
    setting => 'Color',
    value   => '166,227,45',
  }

  ini_setting { "konsole Color2Intense":
    ensure  => present,
    path    => "${user_home_path}/.kde4/share/apps/konsole/Monokai.colorscheme",
    section => 'Color2Intense',
    setting => 'Color',
    value   => '177,227,50',
  }

  ini_setting { "konsole Color3":
    ensure  => present,
    path    => "${user_home_path}/.kde4/share/apps/konsole/Monokai.colorscheme",
    section => 'Color3',
    setting => 'Color',
    value   => '252,149,30',
  }

  ini_setting { "konsole Color3Intense":
    ensure  => present,
    path    => "${user_home_path}/.kde4/share/apps/konsole/Monokai.colorscheme",
    section => 'Color3Intense',
    setting => 'Color',
    value   => '252,82,9',
  }

  ini_setting { "konsole Color4":
    ensure  => present,
    path    => "${user_home_path}/.kde4/share/apps/konsole/Monokai.colorscheme",
    section => 'Color4',
    setting => 'Color',
    value   => '118,76,255',
  }

  ini_setting { "konsole Color4Intense":
    ensure  => present,
    path    => "${user_home_path}/.kde4/share/apps/konsole/Monokai.colorscheme",
    section => 'Color4Intense',
    setting => 'Color',
    value   => '72,102,255',
  }

  ini_setting { "konsole Color5":
    ensure  => present,
    path    => "${user_home_path}/.kde4/share/apps/konsole/Monokai.colorscheme",
    section => 'Color5',
    setting => 'Color',
    value   => '250,37,115',
  }

  ini_setting { "konsole Color5Intense":
    ensure  => present,
    path    => "${user_home_path}/.kde4/share/apps/konsole/Monokai.colorscheme",
    section => 'Color5Intense',
    setting => 'Color',
    value   => '250,63,127',
  }

  ini_setting { "konsole Color6":
    ensure  => present,
    path    => "${user_home_path}/.kde4/share/apps/konsole/Monokai.colorscheme",
    section => 'Color6',
    setting => 'Color',
    value   => '103,217,240',
  }

  ini_setting { "konsole Color6Intense":
    ensure  => present,
    path    => "${user_home_path}/.kde4/share/apps/konsole/Monokai.colorscheme",
    section => 'Color6Intense',
    setting => 'Color',
    value   => '28,219,240',
  }

  ini_setting { "konsole Color7":
    ensure  => present,
    path    => "${user_home_path}/.kde4/share/apps/konsole/Monokai.colorscheme",
    section => 'Color7',
    setting => 'Color',
    value   => '225,225,218',
  }

  ini_setting { "konsole Color7Intense":
    ensure  => present,
    path    => "${user_home_path}/.kde4/share/apps/konsole/Monokai.colorscheme",
    section => 'Color7Intense',
    setting => 'Color',
    value   => '255,255,255',
  }

  ini_setting { "konsole Foreground":
    ensure  => present,
    path    => "${user_home_path}/.kde4/share/apps/konsole/Monokai.colorscheme",
    section => 'Foreground',
    setting => 'Color',
    value   => '225,225,218',
  }

  ini_setting { "konsole ForegroundIntense":
    ensure  => present,
    path    => "${user_home_path}/.kde4/share/apps/konsole/Monokai.colorscheme",
    section => 'ForegroundIntense',
    setting => 'Color',
    value   => '255,255,255',
  }

  ini_setting { "konsole Description":
    ensure  => present,
    path    => "${user_home_path}/.kde4/share/apps/konsole/Monokai.colorscheme",
    section => 'General',
    setting => 'Description',
    value   => 'Monokai',
  }

  ini_setting { "konsole Opacity":
    ensure  => present,
    path    => "${user_home_path}/.kde4/share/apps/konsole/Monokai.colorscheme",
    section => 'General',
    setting => 'Opacity',
    value   => '1',
  }

  ini_setting { "konsole Wallpaper":
    ensure  => present,
    path    => "${user_home_path}/.kde4/share/apps/konsole/Monokai.colorscheme",
    section => 'General',
    setting => 'Wallpaper',
    value   => '',
  }

  ini_setting { "konsole ColorScheme":
    ensure  => present,
    path    => "${user_home_path}/.kde4/share/apps/konsole/Shell.profile",
    section => 'Appearance',
    setting => 'ColorScheme',
    value   => 'Monokai',
  }
}
