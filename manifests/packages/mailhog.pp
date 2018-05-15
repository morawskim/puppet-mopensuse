class mopensuse::packages::mailhog (
  $ensure = 'present'
) {
  include mopensuse::packages::firewall

  package { 'mailhog':
    ensure => $ensure
  }

  exec { 'firewall_open_http_mailhog_port':
    command => 'sysconf_addword /etc/sysconfig/SuSEfirewall2 FW_CONFIGURATIONS_EXT mailhog-http',
    unless  => 'grep "mailhog-http" /etc/sysconfig/SuSEfirewall2 | grep "FW_CONFIGURATIONS_EXT"',
    path    => ['/usr/sbin', '/usr/bin'],
    require => [ Package['mailhog'], Class['mopensuse::packages::firewall'] ],
    notify  => Class['mopensuse::services::firewall']
  }
}
