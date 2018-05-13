class mopensuse::packages::gui::step (
  $ensure = 'present'
) {

  package { 'step':
    ensure => $ensure,
  }
}
