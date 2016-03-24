class mopensuse::packages::gui::steam {
    
  include mopensuse::zypper::repositories::games_tools
  include mopensuse::packages::firewall
  
  package {'steam':
    ensure  => present,
    require => Class['mopensuse::zypper::repositories::games_tools']
  }
  
  file {'/etc/sysconfig/SuSEfirewall2.d/services/steam-streaming':
    ensure  => present,
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    source  => "puppet:///modules/${module_name}/steam/SuSEfirewall.steam-streaming",
    require => Package['steam']
  }
  
  exec {'firewall_open_steam_streaming':
    command => 'sysconf_addword /etc/sysconfig/SuSEfirewall2 FW_CONFIGURATIONS_EXT steam-streaming',
    unless  => 'grep "steam-streaming" /etc/sysconfig/SuSEfirewall2 | grep "FW_CONFIGURATIONS_EXT"',
    path    => ['/usr/sbin', '/usr/bin'],
    require => [ File['/etc/sysconfig/SuSEfirewall2.d/services/steam-streaming'], Class['mopensuse::packages::firewall'] ],
    notify  => Class['mopensuse::services::firewall']
  }
}

