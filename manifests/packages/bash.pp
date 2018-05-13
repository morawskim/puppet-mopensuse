class mopensuse::packages::bash (
  $ensure = 'present'
) {

  package { ['bash', 'bash-completion', 'terminfo-base']:
    ensure => $ensure,
  }
}
