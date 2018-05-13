class mopensuse::packages::gui::xorg_x11_server_extra (
  $ensure = 'present'
) {

  package { 'xorg-x11-server-extra':
    ensure => $ensure,
  }
}
