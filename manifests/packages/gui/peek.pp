class mopensuse::packages::gui::peek (
  $ensure = 'present'
) {
  include mopensuse::zypper::repositories::multimedia_apps

  package { 'peek':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::multimedia_apps']
  }
}
