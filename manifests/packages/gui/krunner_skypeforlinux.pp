class mopensuse::packages::gui::krunner_skypeforlinux (
  $ensure = 'present'
) {
  include mopensuse::zypper::repositories::morawskim

  package { 'krunner-skypeforlinux':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::morawskim']
  }
}
