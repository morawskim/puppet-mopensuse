class mopensuse::packages::libcap_progs (
  $ensure = 'present'
) {

  package { ['libcap-progs']:
    ensure => $ensure,
  }
}
