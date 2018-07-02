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

  #vhost dir
  file { '/srv/www/vhosts':
    ensure  => directory,
    mode    => '0755',
    owner   => 'root',
    group   => 'root',
    require => Package['apache2']
  }

  file { '/var/lib/wwwrun/sockets':
    ensure  => directory,
    mode    => '0775',
    owner   => 'wwwrun',
    group   => 'www',
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
