class mopensuse::config::phpmyadmin (
  $files,
  $phpmyadmin_servernode,
  $phpmyadmin_host,
  $phpmyadmin_host_aliases = []
) {
  include mopensuse::packages::phpmyadmin
  include mopensuse::services::apache2

  create_resources(
    'file',
    $files,
    {
      'ensure'  => 'present',
      'require' => Class['mopensuse::packages::phpmyadmin'],
      'notify'  => Class['mopensuse::services::apache2']
    }
  )

  phpmyadmin::server { 'workstation':
    blowfish_key     => 'oowah7Chiu7ohKeieiwee3Ae',
    resource_collect => false,
    apache_group     => 'www',
    require          => Class['mopensuse::packages::phpmyadmin'],
  }

  create_resources(
    'phpmyadmin::servernode',
    $phpmyadmin_servernode,
    {
      'require' => Class['mopensuse::packages::phpmyadmin'],
    }
  )

  host { $phpmyadmin_host:
    ensure       => present,
    ip           => '127.0.0.1',
    host_aliases => $phpmyadmin_host_aliases
  }
}
