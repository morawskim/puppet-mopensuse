class mopensuse::packages::multitail {

  include mopensuse::zypper::repositories::server_monitoring

  package {'multitail':
    ensure          => present,
    install_options => [ {'--from' => 'server_monitoring'}, '--force' ],
    require         => Class['mopensuse::zypper::repositories::server_monitoring']
  }
}
