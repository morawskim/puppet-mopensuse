class mopensuse::config::mysql (
  $files
) {
  include mopensuse::packages::mysql

  create_resources(
    'file',
    $files,
    {
      'ensure'  => 'present',
      'require' => Class['mopensuse::packages::mysql'],
    }
  )
}
