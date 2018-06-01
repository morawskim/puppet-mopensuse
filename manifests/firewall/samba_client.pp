class mopensuse::firewall::samba (
  $ensure = 'present'
) {
  include mopensuse::packages::firewall

  sysconf_addword {'/etc/sysconfig/SuSEfirewall2#FW_CONFIGURATIONS_EXT:samba-server':
    ensure  => $ensure,
    value   => 'samba-server',
    require => Class['mopensuse::packages::firewall']
  }
}
