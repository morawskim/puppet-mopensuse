class mopensuse::packages::pktstat (
  $ensure = 'present'
) {
  include mopensuse::zypper::repositories::server_monitoring

  package { 'pktstat':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::server_monitoring']
  }
}
