class mopensuse::packages::ctags (
  $ensure = 'present'
) {

  package { ['ctags']:
    ensure => $ensure,
  }
}
