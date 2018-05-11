class mopensuse::packages::gui::steam($ensure = 'present') {
    
  include mopensuse::zypper::repositories::games_tools
  include mopensuse::packages::firewall
  include mopensuse::config::steam
  
  package {'steam':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::games_tools']
  }

  exec {'firewall_open_steam_streaming':
    command => 'sysconf_addword /etc/sysconfig/SuSEfirewall2 FW_CONFIGURATIONS_EXT steam-streaming',
    unless  => 'grep "steam-streaming" /etc/sysconfig/SuSEfirewall2 | grep "FW_CONFIGURATIONS_EXT"',
    path    => ['/usr/sbin', '/usr/bin'],
    require => [ /*Class['mopensuse::config::steam'],*/ Class['mopensuse::packages::firewall'] ],
    notify  => Class['mopensuse::services::firewall']
  }
}

