class mopensuse::packages::gui::lshw_gui (
  $ensure = 'present'
) {
  include mopensuse::zypper::repositories::hardware

  package { 'lshw-gui':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::hardware']
  }
}
