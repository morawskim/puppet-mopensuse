class mopensuse::packages::glances (
  $ensure = 'present'
) {
  include mopensuse::zypper::repositories::server_monitoring

  package { 'python-glances':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::server_monitoring']
  }
}
