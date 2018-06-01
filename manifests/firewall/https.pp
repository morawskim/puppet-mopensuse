class mopensuse::firewall::https (
  $ensure = 'present'
) {
  include mopensuse::packages::firewall

  sysconf_addword {'/etc/sysconfig/SuSEfirewall2#FW_CONFIGURATIONS_EXT:apache2-ssl':
    ensure  => $ensure,
    value   => 'apache2-ssl',
    require => Class['mopensuse::packages::firewall']
  }
}