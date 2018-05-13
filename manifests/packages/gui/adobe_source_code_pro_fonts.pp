class mopensuse::packages::gui::adobe_source_code_pro_fonts (
  $ensure = 'present'
) {

  include mopensuse::zypper::repositories::morawskim
  if $::operatingsystemrelease > 13.2 {
    $packagename = 'adobe-sourcecodepro-fonts'
  } else {
    $packagename = 'adobe-source-code-pro-fonts'
  }
  package { $packagename:
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::morawskim']
  }
}
