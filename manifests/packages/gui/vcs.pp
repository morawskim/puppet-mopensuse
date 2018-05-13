class mopensuse::packages::gui::vcs (
  $ensure = 'present'
) {

  package { ['gitk', 'kdesvn']:
    ensure => $ensure,
  }
}
