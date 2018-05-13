class mopensuse::packages::strace (
  $ensure = 'present'
) {

  package { ['strace']:
    ensure => $ensure,
  }
}
