class mopensuse::packages::pax_utils (
  $ensure = 'present'
) {

  package { 'pax-utils':
    ensure => $ensure,
  }
}
