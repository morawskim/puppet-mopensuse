class mopensuse::packages::gui::gstreamer_plugins (
  $ensure = 'present'
) {
  include mopensuse::zypper::repositories::packman

  package { ['gstreamer-plugins-bad', 'gstreamer-plugins-ugly',
    'gstreamer-plugins-ugly-orig-addon', 'gstreamer-plugins-libav']:
    ensure          => $ensure,
    install_options => [ { '--from' => 'packman' } ],
    require         => [
      Class['mopensuse::zypper::repositories::packman']
    ]
  }
}
