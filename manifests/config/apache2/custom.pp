class mopensuse::config::apache2::custom (
  $files
) {
  include mopensuse::packages::apache2
  include mopensuse::services::apache2

  create_resources(
    'file',
    $files,
    {
      'ensure'  => 'present',
      'notify'  => Class['mopensuse::services::apache2'],
      'require' => Class['mopensuse::packages::apache2'],
    }
  )
}
