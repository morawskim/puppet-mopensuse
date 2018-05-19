class mopensuse::config::selenium (
  $files,
  $chromedrive_path
) {
  include mopensuse::packages::selenium
  include mopensuse::packages::augeas
  include mopensuse::services::selenium

  create_resources(
    'file',
    $files,
    {
      'ensure'  => 'present',
      'require' => Class['mopensuse::packages::selenium'],
    }
  )

  augeas { '/files/etc/sysconfig/selenium/SELENIUM_ARGS':
    changes => [
      "set /files/etc/sysconfig/selenium/SELENIUM_ARGS '\"-Dwebdriver.chrome.driver=${chromedrive_path}\"'",
    ],
    require => [ Class['mopensuse::packages::augeas'], Class['mopensuse::packages::selenium'] ],
    notify  => Class['mopensuse::services::selenium']
  }
}
