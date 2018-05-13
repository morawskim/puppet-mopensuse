class mopensuse::packages::gui::virtualbox_qt (
  $ensure = 'present'
) {

  package { 'virtualbox-qt':
    ensure => $ensure,
  }
}
