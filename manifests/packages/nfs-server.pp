class mopensuse::packages::nfs-server {
  
  include mopensuse::packages::firewall
  
  package {['nfs-kernel-server']:
    ensure => present
  }
  
  exec {'firewall_open_nfs_server_port':
    command => 'sysconf_addword /etc/sysconfig/SuSEfirewall2 FW_CONFIGURATIONS_EXT nfs-kernel-server',
    unless  => 'grep "nfs-kernel-server" /etc/sysconfig/SuSEfirewall2 | grep "FW_CONFIGURATIONS_EXT"',
    path    => ['/usr/sbin', '/usr/bin'],
    require => [ Package['nfs-kernel-server'], Class['mopensuse::packages::firewall'] ],
    notify  => Class['mopensuse::services::firewall']
  }
  
  service {'nfsserver':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    require    => [ Package['nfs-kernel-server'], File['/etc/exports'] ]
  }
  
  file{'/etc/exports':
    ensure  => present,
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    source  => "puppet:///modules/${module_name}/nfs/exports",
    notify  => Service['nfsserver'],
    require => Package['nfs-kernel-server']
  }
  
  file {'/srv/nfs':
    ensure  => directory,
    mode    => '1755',
    owner   => 'root',
    group   => 'root',
    before  => Package['nfs-kernel-server']
  }
  
  file {'/srv/nfs/public':
    ensure  => directory,
    mode    => '1755',
    owner   => 'nobody',
    group   => 'nobody',
    before  => Package['nfs-kernel-server']
  }
}