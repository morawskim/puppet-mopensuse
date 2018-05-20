class mopensuse::config::php54v (
  $files
) {
  include mopensuse::packages::php54v

  create_resources(
    'file',
    $files,
    {
      'ensure'  => 'present',
      'require' => Class['mopensuse::packages::php54v'],
    }
  )
}
