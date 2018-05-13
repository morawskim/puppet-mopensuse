class mopensuse::packages::gui::ghex (
  $ensure = 'present'
) {

  package { 'ghex':
    ensure => $ensure,
  }
}
