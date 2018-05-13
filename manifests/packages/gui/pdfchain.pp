class mopensuse::packages::gui::pdfchain (
  $ensure = 'present'
) {

  package { 'pdfchain':
    ensure => $ensure,
  }
}
