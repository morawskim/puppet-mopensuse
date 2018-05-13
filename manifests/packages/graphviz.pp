class mopensuse::packages::graphviz (
  $ensure = 'present'
) {

  package { ['graphviz']:
    ensure => $ensure,
  }
}
