class mopensuse::config::php53v (
  $files
) {
  include mopensuse::packages::php53v

  create_resources(
    'file',
    $files,
    {
      'ensure'  => 'present',
      'require' => Class['mopensuse::packages::php53v'],
    }
  )
}
