class mopensuse::packages::gui::susepaste_screenshot (
  $ensure = 'present'
) {

  package { ['susepaste-screenshot']:
    ensure => $ensure,
  }
}
