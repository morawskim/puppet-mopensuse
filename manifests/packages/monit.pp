class mopensuse::packages::monit($ensure = 'present') {

  include mopensuse::zypper::repositories::server_monitoring

  package {'monit':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::server_monitoring']
  }
}
