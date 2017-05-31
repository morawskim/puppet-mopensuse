class mopensuse::packages::samba-client($ensure = 'present') {
  
  include mopensuse::packages::firewall
  
  package {'samba-client':
    ensure => $ensure,
  }
  
  #firewall samba client
  exec {'firewall_open_samba_client_port':
    command => 'sysconf_addword /etc/sysconfig/SuSEfirewall2 FW_CONFIGURATIONS_EXT samba-client',
    unless  => 'grep "samba-client" /etc/sysconfig/SuSEfirewall2 | grep "FW_CONFIGURATIONS_EXT"',
    path    => ['/usr/sbin', '/usr/bin'],
    require => [ Package['samba-client'], Class['mopensuse::packages::firewall'] ],
    notify  => Class['mopensuse::services::firewall']
  }
  
}