class mopensuse::packages::samba_client (
  $ensure = 'present'
) {
  include mopensuse::packages::firewall

  package { 'samba-client':
    ensure => $ensure,
  }
}
