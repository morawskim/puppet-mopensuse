class mopensuse::config::steam (
  $files
) {
  include mopensuse::packages::gui::steam

  create_resources(
    'file',
    $files,
    {
      'ensure'  => 'present',
      'require' => Class['mopensuse::packages::gui::steam'],
    }
  )
}
