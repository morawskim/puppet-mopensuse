class mopensuse::packages::gui::susepaste_qt (
  $ensure = 'present'
) {
  include mopensuse::zypper::repositories::morawskim

  package { 'susepaste-qt':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::morawskim']
  }
}
