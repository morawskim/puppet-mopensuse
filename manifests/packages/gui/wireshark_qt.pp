class mopensuse::packages::gui::wireshark_qt (
  $ensure = 'present'
) {

  package { 'wireshark-ui-qt':
    ensure => $ensure,
  }
}
