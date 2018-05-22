class mopensuse::config::php71v (
  $files
) {
  include mopensuse::packages::php71v

  create_resources(
    'file',
    $files,
    {
      'ensure'  => 'present',
      'require' => Class['mopensuse::packages::php71v'],
    }
  )
}
