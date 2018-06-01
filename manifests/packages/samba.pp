class mopensuse::packages::samba (
  $ensure = 'present'
) {
  include mopensuse::packages::firewall
  include samba::server

  #managed by samba module
  #package {'samba':
  #  ensure => $ensure,
  #}

  #service { 'smb':
  #  ensure      => 'running',
  #  hasstatus   => true,
  #  hasrestart  => true,
  #  enable      => true,
  #  require     => Package['samba']
  #}

  package { 'samba-doc':
    ensure  => $ensure,
    require => Package['samba']
  }

  file { '/srv/samba':
    ensure => directory,
    mode   => '1755',
    owner  => 'root',
    group  => 'root',
    before => Package['samba']
  }

  file { '/srv/samba/public':
    ensure  => directory,
    mode    => '1777',
    owner   => 'root',
    group   => 'root',
    require => File['/srv/samba']
  }

  file { '/etc/samba/dhcp.conf':
    ensure  => present,
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    require => Package['samba'],
    notify  => Class['samba::server']
  }
}
