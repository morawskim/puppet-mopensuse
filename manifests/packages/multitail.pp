class mopensuse::packages::multitail($ensure = 'present') {

  include mopensuse::zypper::repositories::server_monitoring

  package {'multitail':
    ensure          => $ensure,
    install_options => [ {'--from' => 'server_monitoring'}, '--force' ],
    require         => Class['mopensuse::zypper::repositories::server_monitoring']
  }
}
