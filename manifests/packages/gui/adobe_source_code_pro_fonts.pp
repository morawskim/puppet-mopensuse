class mopensuse::packages::gui::adobe_source_code_pro_fonts (
  $ensure = 'present'
) {

  $packagename = 'adobe-sourcecodepro-fonts'
  package { $packagename:
    ensure  => $ensure,
  }
}
