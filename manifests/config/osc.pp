class mopensuse::config::osc($files) {
  include mopensuse::packages::osc

  create_resources(
    'file',
    $files,
    {
      'ensure'  => 'present',
      'require' => Class['mopensuse::packages::osc'],
    }
  )
}
