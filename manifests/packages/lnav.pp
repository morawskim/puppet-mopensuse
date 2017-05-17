class mopensuse::packages::lnav {

  include mopensuse::zypper::repositories::server_monitoring

  package {'lnav':
    ensure  => present,
    require => Class['mopensuse::zypper::repositories::server_monitoring']
  }
}