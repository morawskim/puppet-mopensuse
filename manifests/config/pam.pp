class mopensuse::config::pam (
  $files
) {

  create_resources(
    'file',
    $files,
    {
      'ensure'  => 'present',
    }
  )
}
