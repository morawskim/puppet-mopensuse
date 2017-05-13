define mopensuse::user::config::kwrite (
  $user,
  $user_home_path
) {

  ini_setting { "kwrite line numbers":
    ensure  => present,
    path    => "${user_home_path}/.kde4/share/config/kwriterc",
    section => 'Kate View Defaults',
    setting => 'Line Numbers',
    value   => 'true',
  }

  ini_setting { "kwrite scroll bar mini map":
    ensure  => present,
    path    => "${user_home_path}/.kde4/share/config/kwriterc",
    section => 'Kate View Defaults',
    setting => 'Scroll Bar Mini Map',
    value   => 'true',
  }

  ini_setting { "kwrite scroll bar mini map width":
    ensure  => present,
    path    => "${user_home_path}/.kde4/share/config/kwriterc",
    section => 'Kate View Defaults',
    setting => 'Scroll Bar Mini Map Width',
    value   => 60,
  }

  ini_setting { "kwrite show line modification":
    ensure  => present,
    path    => "${user_home_path}/.kde4/share/config/kwriterc",
    section => 'Kate View Defaults',
    setting => 'Line Modification',
    value   => 'true',
  }

  ini_setting { "kwrite indentation settings":
    ensure  => present,
    path    => "${user_home_path}/.kde4/share/config/kwriterc",
    section => 'Kate Document Defaults',
    setting => 'Indent On Text Paste',
    value   => 'true',
  }

  ini_setting { "kwrite ReplaceTabsDyn":
    ensure  => present,
    path    => "${user_home_path}/.kde4/share/config/kwriterc",
    section => 'Kate Document Defaults',
    setting => 'ReplaceTabsDyn',
    value   => 'true',
  }

  ini_setting { "kwrite tab width":
    ensure  => present,
    path    => "${user_home_path}/.kde4/share/config/kwriterc",
    section => 'Kate Document Defaults',
    setting => 'Tab Width',
    value   => 4,
  }
}
