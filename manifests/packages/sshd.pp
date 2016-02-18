class mopensuse::packages::sshd {
  
  service {'sshd':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    require    => Package['openssh']
  }
  
  #firewall ssh
  exec{'firewall_open_sshd_port':
    command => 'sysconf_addword /etc/sysconfig/SuSEfirewall2 FW_CONFIGURATIONS_EXT sshd',
    unless  => 'grep "sshd" /etc/sysconfig/SuSEfirewall2 | grep "FW_CONFIGURATIONS_EXT"',
    path    => ['/usr/sbin', '/usr/bin'],
    require => [ Package['openssh'] ]
  }

  package {'openssh':
    ensure     => present
  }
  
}