class mopensuse::config::phpmyadmin40 (
  $files,
  $phpmyadmin_servernode,
  $phpmyadmin_host,
  $phpmyadmin_host_aliases = []
) {
  include mopensuse::packages::phpmyadmin40
  include mopensuse::services::apache2

  create_resources(
    'file',
    $files,
    {
      'ensure'  => 'present',
      'require' => Class['mopensuse::packages::phpmyadmin40'],
      'notify'  => Class['mopensuse::services::apache2']
    }
  )

  phpmyadmin::server { 'workstation40':
    #blowfish_key => 'oowah7Chiu7ohKeieiwee3Ae',
    config_file      => '/etc/phpMyAdmin40/config.inc.php',
    data_dir         => '/etc/phpMyAdmin40/',
    resource_collect => false,
    apache_group     => 'www',
    package_name     => 'phpMyAdmin40',
    require          => Class['mopensuse::packages::phpmyadmin40'],
  }

  create_resources(
    'phpmyadmin::servernode',
    $phpmyadmin_servernode,
    {
      'target'  => '/etc/phpMyAdmin40/config.inc.php',
      'require' => Class['mopensuse::packages::phpmyadmin40'],
    }
  )

  host { $phpmyadmin_host:
    ensure       => present,
    ip           => '127.0.0.1',
    host_aliases => $phpmyadmin_host_aliases
  }
}
