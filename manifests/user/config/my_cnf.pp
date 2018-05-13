define mopensuse::user::config::my_cnf (
  $my_cnf_path
) {

  ini_setting { "${my_cnf_path} - set root password":
    ensure  => present,
    path    => $my_cnf_path,
    section => 'client',
    setting => 'password',
    value   => hiera('mopensuse::packages::mysql::mysql_root_password',
      'no_set_value_for_mopensuse::packages::mysql::mysql_root_password_in_hieradata'),
  }

  ini_setting { "${my_cnf_path} - set root username":
    ensure  => present,
    path    => $my_cnf_path,
    section => 'client',
    setting => 'user',
    value   => hiera('mopensuse::packages::mysql::mysql_root_username', 'root'),
    before  => Ini_setting["${my_cnf_path} - set root password"]
  }

  file { $my_cnf_path:
    ensure => present,
    mode   => '0600',
  }
}
