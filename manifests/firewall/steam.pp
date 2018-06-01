class mopensuse::firewall::http (
  $ensure = 'present'
) {
  include mopensuse::packages::firewall

  sysconf_addword {'/etc/sysconfig/SuSEfirewall2#FW_CONFIGURATIONS_EXT:steam-streaming':
    ensure  => $ensure,
    value   => 'steam-streaming',
    require => Class['mopensuse::packages::firewall']
  }
}
