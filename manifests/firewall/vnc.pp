class mopensuse::firewall::vnc (
  $ensure = 'present'
) {
  include mopensuse::packages::firewall

  sysconf_addword {'/etc/sysconfig/SuSEfirewall2#FW_CONFIGURATIONS_EXT:vnc-server':
    ensure  => $ensure,
    value   => 'vnc-server',
    require => Class['mopensuse::packages::firewall']
  }
}
