class mopensuse::config::sysctl($files) {

  create_resources(
    'file',
    $files,
    {
      'ensure'  => 'present',
    }
  )
}
