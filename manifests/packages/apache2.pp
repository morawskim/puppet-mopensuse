class mopensuse::packages::apache2 (
  $ensure = 'present'
) {
  include mopensuse::packages::firewall
  include mopensuse::services::apache2

  package { ['apache2']:
    ensure => $ensure,
  }

  exec { 'define_apache_ssl_flag':
    command => 'a2enflag SSL',
    path    => ['/usr/sbin/', '/usr/bin', '/bin'],
    unless  => "grep -e '^APACHE_SERVER_FLAGS' /etc/sysconfig/apache2 | grep SSL",
    require => [ Package['apache2'] ],
    notify  => Class['mopensuse::services::apache2']
  }

  #firewall http i https
  exec { 'firewall_open_http_server_port':
    command => 'sysconf_addword /etc/sysconfig/SuSEfirewall2 FW_CONFIGURATIONS_EXT apache2',
    unless  =>
      'cat /etc/sysconfig/SuSEfirewall2 | grep -E "^\s*FW_CONFIGURATIONS_EXT" | cut -f2 -d= | sed -n \'s/^"\(.*\)"$/\1/p\' | tr -s " " | tr " " "\n" | grep -E "^apache2$"'
    ,
    path    => ['/usr/sbin', '/usr/bin'],
    require => [ Package['apache2'], Class['mopensuse::packages::firewall'] ]
  }

  exec { 'firewall_open_https_server_port':
    command => 'sysconf_addword /etc/sysconfig/SuSEfirewall2 FW_CONFIGURATIONS_EXT apache2-ssl',
    unless  => 'grep "apache2-ssl" /etc/sysconfig/SuSEfirewall2 | grep "FW_CONFIGURATIONS_EXT"',
    path    => ['/usr/sbin', '/usr/bin'],
    require => [ Package['apache2'], Class['mopensuse::packages::firewall'] ]
  }

  #vhost dir
  file { '/srv/www/vhosts':
    ensure  => directory,
    mode    => '0755',
    owner   => 'root',
    group   => 'root',
    require => Package['apache2']
  }

  file { '/var/log/apache2':
    ensure  => directory,
    mode    => '0750',
    owner   => 'root',
    group   => 'www',
    require => Package['apache2']
  }
}
