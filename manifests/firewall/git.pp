class mopensuse::firewall::git (
  $ensure = 'present'
) {
  include mopensuse::packages::firewall

  sysconf_addword {'/etc/sysconfig/SuSEfirewall2#FW_CONFIGURATIONS_EXT:git-daemon':
    ensure  => $ensure,
    value   => 'git-daemon',
    require => Class['mopensuse::packages::firewall']
  }
}
