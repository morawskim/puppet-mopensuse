class mopensuse::packages::gearmand {

  include mopensuse::zypper::repositories::server_monitoring

  package {['gearmand-server', 'gearmand-tools']:
    ensure  => present,
    require => Class['mopensuse::zypper::repositories::server_monitoring']
  }
}