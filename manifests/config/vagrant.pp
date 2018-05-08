class mopensuse::config::vagrant($files) {
  include mopensuse::packages::vagrant

  create_resources(
    'file',
    $files,
    {
      'ensure'  => 'present',
      'require' => Class['mopensuse::packages::vagrant'],
    }
  )
}
