class mopensuse::packages::cups (
  $ensure = 'present'
) {
  include mopensuse::services::cups

  package { 'cups':
    ensure => $ensure,
  }
}
