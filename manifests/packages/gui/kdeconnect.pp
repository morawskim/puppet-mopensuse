class mopensuse::packages::gui::kdeconnect {

  include mopensuse::zypper::repositories::kde_extra

  if $::operatingsystemrelease > 13.2 {
    $packagename = 'kdeconnect-kde'
  } else {
    $packagename = 'kdeconnect-kde4'
  }

  package {$packagename:
    ensure  => present,
    require => Class['mopensuse::zypper::repositories::kde_extra']
  }

  exec {'firewall_open_kdeconnect':
    command => 'sysconf_addword /etc/sysconfig/SuSEfirewall2 FW_CONFIGURATIONS_EXT kdeconnect-kde',
    unless  => 'grep "kdeconnect-kde" /etc/sysconfig/SuSEfirewall2 | grep "FW_CONFIGURATIONS_EXT"',
    path    => ['/usr/sbin', '/usr/bin'],
    require => [ Package[$packagename], Class['mopensuse::packages::firewall'] ],
    notify  => Class['mopensuse::services::firewall']
  }
}
