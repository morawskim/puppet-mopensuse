class mopensuse::packages::firewall (
  $ensure = 'present'
) {
  include mopensuse::services::firewall

  package { 'SuSEfirewall2':
    ensure => $ensure,
  }
}
