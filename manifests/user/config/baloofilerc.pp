define mopensuse::user::config::baloofilerc (
  $baloofilerc_path,
  $aaaa
) {

  ini_setting { "${baloofilerc_path} - set root password":
    ensure  => present,
    path    => $baloofilerc_path,
    section => 'General',
    setting => 'exclude folders[$e]',
    value   => $aaaa
  }

  file {$baloofilerc_path:
    ensure => present,
    mode   => '0600',
  }
}
