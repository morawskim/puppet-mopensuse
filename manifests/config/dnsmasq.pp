class mopensuse::config::dnsmasq (
  $files
) {
  include mopensuse::packages::dnsmasq

  create_resources(
    'file',
    $files,
    {
      'ensure'  => 'present',
      'require' => Class['mopensuse::packages::dnsmasq'],
    }
  )
}
