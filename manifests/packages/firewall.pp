class mopensuse::packages::firewall (
  $ensure = 'present'
) {
  include mopensuse::services::firewall

  package { 'firewalld':
    ensure => $ensure,
  }
}
