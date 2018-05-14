class mopensuse::packages::firewall (
  $ensure = 'present'
) {
  include mopensuse::services::firewall
  include mopensuse::config::firewall

  package { 'SuSEfirewall2':
    ensure => $ensure,
  }
}
