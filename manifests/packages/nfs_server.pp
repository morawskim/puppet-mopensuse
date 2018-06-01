class mopensuse::packages::nfs_server (
  $ensure = 'present'
) {
  include mopensuse::packages::firewall
  include mopensuse::services::nfs_server
  include mopensuse::config::nfs_server

  package { ['nfs-kernel-server']:
    ensure => $ensure,
  }

  file { '/srv/nfs':
    ensure => directory,
    mode   => '1755',
    owner  => 'root',
    group  => 'root',
    before => Package['nfs-kernel-server']
  }
}
