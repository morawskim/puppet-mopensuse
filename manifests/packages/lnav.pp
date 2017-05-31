class mopensuse::packages::lnav($ensure = 'present') {

  include mopensuse::zypper::repositories::server_monitoring

  package {'lnav':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::server_monitoring']
  }
}