class mopensuse::packages::gearmand($ensure = 'present') {

  include mopensuse::zypper::repositories::server_monitoring

  package {['gearmand-server', 'gearmand-tools']:
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::server_monitoring']
  }
}