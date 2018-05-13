class mopensuse::packages::gui::minitube (
  $ensure = 'present'
) {
  include mopensuse::zypper::repositories::multimedia_apps

  package { 'minitube':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::multimedia_apps']
  }
}
