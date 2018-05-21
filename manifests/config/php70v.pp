class mopensuse::config::php70v (
  $files
) {
  include mopensuse::packages::php70v

  create_resources(
    'file',
    $files,
    {
      'ensure'  => 'present',
      'require' => Class['mopensuse::packages::php70v'],
    }
  )
}
