class mopensuse::packages::gui::xrectsel (
  $ensure = 'present'
) {
  include mopensuse::zypper::repositories::morawskim

  package { 'xrectsel':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::morawskim']
  }
}
