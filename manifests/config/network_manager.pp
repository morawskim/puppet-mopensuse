class mopensuse::config::network_manager (
  $files
) {

  file {'/etc/NetworkManager/conf.d':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }

  create_resources(
    'file',
    $files,
    {
      'ensure'  => 'present',
      'require' => File['/etc/NetworkManager/conf.d'],
    }
  )
}
