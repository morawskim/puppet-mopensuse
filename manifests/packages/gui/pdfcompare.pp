class mopensuse::packages::gui::pdfcompare (
  $ensure = 'present'
) {

  package { 'pdfcompare':
    ensure => $ensure,
  }
}
