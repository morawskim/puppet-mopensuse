class mopensuse::firewall::sshd (
  $ensure = 'present'
) {
  include mopensuse::packages::firewall

  sysconf_addword {'/etc/sysconfig/SuSEfirewall2#FW_CONFIGURATIONS_EXT:sshd':
    ensure  => $ensure,
    value   => 'sshd',
    require => Class['mopensuse::packages::firewall']
  }
}
