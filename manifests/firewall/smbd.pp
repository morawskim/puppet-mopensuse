class mopensuse::firewall::samba_client (
  $ensure = 'present'
) {
  include mopensuse::packages::firewall

  sysconf_addword {'/etc/sysconfig/SuSEfirewall2#FW_CONFIGURATIONS_EXT:samba-client':
    ensure  => $ensure,
    value   => 'samba-client',
    require => Class['mopensuse::packages::firewall']
  }
}
