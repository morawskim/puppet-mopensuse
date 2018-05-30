class mopensuse::firewall::mailhog_http (
  $ensure = 'present'
) {
  include mopensuse::packages::firewall

  sysconf_addword {'/etc/sysconfig/SuSEfirewall2#FW_CONFIGURATIONS_EXT:mailhog-http':
    ensure  => $ensure,
    value   => 'mailhog-http',
    require => Class['mopensuse::packages::firewall']
  }
}
