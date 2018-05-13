class mopensuse::packages::ca_certificates (
  $ensure = 'present'
) {

  package { ['ca-certificates']:
    ensure => $ensure,
  }
}
