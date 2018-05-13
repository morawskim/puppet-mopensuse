define mopensuse::user::config::baloofilerc (
  $baloofilerc_path,
  $exclude_folders
) {

  ini_setting { "${baloofilerc_path} - set exclude folders":
    ensure  => present,
    path    => $baloofilerc_path,
    section => 'General',
    setting => 'exclude folders[$e]',
    value   => $exclude_folders
  }

  file { $baloofilerc_path:
    ensure => present,
    mode   => '0600',
  }
}
