class mopensuse::packages::sshd($ensure = 'present') {
  include mopensuse::services::sshd

  #firewall ssh
  exec{'firewall_open_sshd_port':
    command => 'sysconf_addword /etc/sysconfig/SuSEfirewall2 FW_CONFIGURATIONS_EXT sshd',
    unless  => 'grep "sshd" /etc/sysconfig/SuSEfirewall2 | grep "FW_CONFIGURATIONS_EXT"',
    path    => ['/usr/sbin', '/usr/bin'],
    require => [ Package['openssh'] ]
  }

  package {'openssh':
    ensure  => $ensure,
    notify  => Class['mopensuse::services::sshd']
  }
}
