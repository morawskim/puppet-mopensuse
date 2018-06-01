class mopensuse::firewall::nfs (
  $ensure = 'present'
) {
  include mopensuse::packages::firewall

  sysconf_addword {'/etc/sysconfig/SuSEfirewall2#FW_CONFIGURATIONS_EXT:nfs-kernel-server':
    ensure  => $ensure,
    value   => 'nfs-kernel-server',
    require => Class['mopensuse::packages::firewall']
  }
}
