class mopensuse::packages::nmon {

  include mopensuse::zypper::repositories::server_monitoring

  package {'nmon':
    ensure          => present,
    install_options => [ {'--from' => 'server_monitoring'}, '--force' ],
    require         => Class['mopensuse::zypper::repositories::server_monitoring']
  }
}
