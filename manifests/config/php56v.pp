class mopensuse::config::php56v (
  $files
) {
  include mopensuse::packages::php56v

  create_resources(
    'file',
    $files,
    {
      'ensure'  => 'present',
      'require' => Class['mopensuse::packages::php56v'],
    }
  )
}
