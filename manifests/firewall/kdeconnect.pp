class mopensuse::firewall::kdeconnect (
  $ensure = 'present'
) {
  include mopensuse::packages::firewall

  sysconf_addword {'/etc/sysconfig/SuSEfirewall2#FW_CONFIGURATIONS_EXT:kdeconnect-kde':
    ensure  => $ensure,
    value   => 'kdeconnect-kde',
    require => Class['mopensuse::packages::firewall']
  }
}
