class mopensuse::packages::gui::kate (
  $ensure = 'present'
) {

  package { 'kate':
    ensure => $ensure,
  }
}
