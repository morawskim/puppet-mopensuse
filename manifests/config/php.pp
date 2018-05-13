class mopensuse::config::php (
  $files
) {
  include mopensuse::packages::php

  create_resources(
    'file',
    $files,
    {
      'ensure'  => 'present',
      'require' => Class['mopensuse::packages::php'],
    }
  )
}
