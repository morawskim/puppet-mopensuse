class mopensuse::packages::samba {
  
  include mopensuse::packages::firewall
  include samba::server

  #managed by samba module
  #package {'samba':
  #  ensure => present
  #}
  
  #service { 'smb':
  #  ensure      => 'running',
  #  hasstatus   => true,
  #  hasrestart  => true,
  #  enable      => true,
  #  require     => Package['samba']
  #}

  package {'samba-doc':
    ensure  => present,
    require => Package['samba']
  }

  #firewall samba server
  exec {'firewall_open_samba_server_port':
    command => 'sysconf_addword /etc/sysconfig/SuSEfirewall2 FW_CONFIGURATIONS_EXT samba-server',
    unless  => 'grep "samba-server" /etc/sysconfig/SuSEfirewall2 | grep "FW_CONFIGURATIONS_EXT"',
    path    => ['/usr/sbin', '/usr/bin'],
    require => [ Package['samba'], Class['mopensuse::packages::firewall'] ],
    notify  => Class['mopensuse::services::firewall']
  }

  file {'/srv/samba':
    ensure  => directory,
    mode    => '1755',
    owner   => 'root',
    group   => 'root',
    before  => Package['samba']
  }

  file {'/srv/samba/public':
    ensure  => directory,
    mode    => '1777',
    owner   => 'root',
    group   => 'root',
    require => File['/srv/samba']
  }

  file {'/etc/samba/dhcp.conf':
      ensure   => present,
      mode     => '644',
      owner    => 'root',
      group    => 'root',
      require  => Package['samba'],
      notify   => Class['samba::server']
  }
} 
