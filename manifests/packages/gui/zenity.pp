class mopensuse::packages::gui::zenity (
  $ensure = 'present'
) {

  package { 'zenity':
    ensure => $ensure,
  }
}
