class mopensuse::config::cgit (
  $files,
  $cgit_host,
  $cgit_host_aliases = []
) {
  include mopensuse::packages::cgit
  include mopensuse::services::apache2

  create_resources(
    'file',
    $files,
    {
      'ensure'  => 'present',
      'require' => Class['mopensuse::packages::cgit'],
      'notify'  => Class['mopensuse::services::apache2']
    }
  )

  host { $cgit_host:
    ensure       => present,
    ip           => '127.0.0.1',
    host_aliases => $cgit_host_aliases
  }
}
