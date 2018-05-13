class mopensuse::packages::gui::jetbrains_toolbox (
  $ensure = 'present'
) {
  include mopensuse::zypper::repositories::morawskim

  package { 'jetbrains-toolbox':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::morawskim']
  }
}
