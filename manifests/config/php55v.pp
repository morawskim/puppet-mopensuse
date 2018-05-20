class mopensuse::config::php55v (
  $files
) {
  include mopensuse::packages::php55v

  create_resources(
    'file',
    $files,
    {
      'ensure'  => 'present',
      'require' => Class['mopensuse::packages::php55v'],
    }
  )
}
