class mopensuse::firewall::http (
  $ensure = 'present'
) {
  include mopensuse::packages::firewall

  sysconf_addword {'/etc/sysconfig/SuSEfirewall2#FW_CONFIGURATIONS_EXT:apache2':
    ensure  => $ensure,
    value   => 'apache2',
    require => Class['mopensuse::packages::firewall']
  }
}
