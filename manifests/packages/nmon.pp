class mopensuse::packages::nmon (
  $ensure = 'present'
) {
  include mopensuse::zypper::repositories::server_monitoring

  package { 'nmon':
    ensure          => $ensure,
    install_options => [ { '--from' => 'server_monitoring' }, '--force' ],
    require         => Class['mopensuse::zypper::repositories::server_monitoring']
  }
}
