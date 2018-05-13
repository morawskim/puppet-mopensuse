class mopensuse::packages::gui::rsibreak (
  $ensure = 'present'
) {

  package { 'rsibreak':
    ensure => $ensure,
  }
}
