class mopensuse::packages::gui::gobby (
  $ensure = 'present'
) {

  package { 'gobby':
    ensure => $ensure,
  }
}
