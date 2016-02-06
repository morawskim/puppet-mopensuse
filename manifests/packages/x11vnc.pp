class mopensuse::packages::x11vnc (
  $vnc_password
) {
  
  include ::systemd
  
  package{'xorg-x11-Xvnc':
    ensure => present
  }
  
  package{'x11vnc':
    ensure => present
  }
  
  #firewall vnc server
  exec{'firewall_open_vnc_server_port':
    command => 'sysconf_addword /etc/sysconfig/SuSEfirewall2 FW_CONFIGURATIONS_EXT vnc-server',
    unless  => 'grep "vnc-server" /etc/sysconfig/SuSEfirewall2 | grep "FW_CONFIGURATIONS_EXT"',
    path    => ['/usr/sbin', '/usr/bin'],
    require => Package['xorg-x11-Xvnc']
  }

  exec{'setup_vnc_pass':
    command => "x11vnc -storepasswd ${vnc_password} /etc/x11vnc.pass",
    #unless  => 'test -e /etc/x11vnc.pass',
    path    => ['/usr/bin'],
    require => [ File['/usr/local/bin/x11vnc-wrapper'] ],
    notify  => Service['x11vnc']
  }
  
  file {'/etc/systemd/system/x11vnc.service':
    ensure  => present,
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    source  => "puppet:///modules/${module_name}/x11vnc/x11vnc.service",
    notify  => [ Exec['systemctl-daemon-reload'], Service['x11vnc'] ],
    require => [ Package['x11vnc'], File['/usr/local/bin/x11vnc-wrapper'] ]
  }
  
  file {'/usr/local/bin/x11vnc-wrapper':
    ensure  => present,
    mode    => '0750',
    owner   => 'root',
    group   => 'root',
    source  => "puppet:///modules/${module_name}/x11vnc/x11vnc-wrapper.sh",
    require => Package['x11vnc']
  }
  
  service {'x11vnc':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    require    => File['/etc/systemd/system/x11vnc.service']
  }
  
}