define mopensuse::user::config::krunner_kopete (
  $user,
  $user_home_path
) {

  ini_setting { "krunner kopete":
    ensure  => present,
    path    => "${user_home_path}/.kde4/share/config/krunnerrc",
    section => 'Plugins',
    setting => 'kopete_runnerEnabled',
    value   => 'false',
    require => Mopensuse::User::Account[$user]
  }

  ini_setting { "krunner kopetecontacts":
    ensure  => present,
    path    => "${user_home_path}/.kde4/share/config/krunnerrc",
    section => 'Plugins',
    setting => 'kopetecontacts_runnerEnabled',
    value   => 'true',
    require => Mopensuse::User::Account[$user]
  }
}
