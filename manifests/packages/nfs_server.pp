class mopensuse::packages::nfs_server (
  $ensure = 'present'
) {
  include mopensuse::packages::firewall
  include mopensuse::services::nfs_server
  include mopensuse::config::nfs_server

  package { ['nfs-kernel-server']:
    ensure => $ensure,
  }

  exec { 'firewall_open_nfs_server_port':
    command => 'sysconf_addword /etc/sysconfig/SuSEfirewall2 FW_CONFIGURATIONS_EXT nfs-kernel-server',
    unless  => 'grep "nfs-kernel-server" /etc/sysconfig/SuSEfirewall2 | grep "FW_CONFIGURATIONS_EXT"',
    path    => ['/usr/sbin', '/usr/bin'],
    require => [ Package['nfs-kernel-server'], Class['mopensuse::packages::firewall'] ],
    notify  => Class['mopensuse::services::firewall']
  }

  file { '/srv/nfs':
    ensure => directory,
    mode   => '1755',
    owner  => 'root',
    group  => 'root',
    before => Package['nfs-kernel-server']
  }
}
