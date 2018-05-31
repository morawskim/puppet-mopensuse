class mopensuse::config::nullmailer (
  $files,
) {
  include mopensuse::packages::nullmailer
  include mopensuse::services::nullmailer

  create_resources(
    'file',
    $files,
    {
      'ensure'  => 'present',
      'require' => Class['mopensuse::packages::nullmailer'],
      'notify'  => Class['mopensuse::services::nullmailer']
    }
  )
}
