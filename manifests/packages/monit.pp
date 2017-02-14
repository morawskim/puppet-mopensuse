class mopensuse::packages::monit {

  include mopensuse::zypper::repositories::server_monitoring

  package {'monit':
    ensure  => present,
    require => Class['mopensuse::zypper::repositories::server_monitoring']
  }
}
