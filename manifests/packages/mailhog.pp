class mopensuse::packages::mailhog($ensure = 'present') {
  
  include mopensuse::packages::firewall
  
  user { 'mailhog':
    ensure     => present,
    shell      => '/bin/bash',
    managehome => false,
    system     => true,
    gid        => 'mailhog',
    require    => Group['mailhog']
  }
  
  group { 'mailhog':
    ensure => present,
    system => true
  }
  
  wget::fetch {'download mailhog':
    source      => 'https://github.com/mailhog/MailHog/releases/download/v0.1.8/MailHog_linux_amd64',
    destination => '/usr/local/bin/mailhog',
    timeout     => 0,
    verbose     => false,
    unless      => 'test -x /usr/local/bin/mailhog'
   }
  
  file {'/usr/local/bin/mailhog':
    ensure  => present,
    mode    => '0755',
    owner   => 'mailhog',
    group   => 'mailhog',
    require => [ User['mailhog'], Wget::Fetch['download mailhog'] ]
  }
  
  file {'/etc/systemd/system/mailhog.service':
    ensure  => present,
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    source  => "puppet:///modules/${module_name}/mailhog/mailhog.service",
    notify  => [ Exec['systemctl-daemon-reload'], Service['mailhog'] ],
    require => File['/usr/local/bin/mailhog']
  }
  
  file {'/etc/sysconfig/SuSEfirewall2.d/services/mailhog-http':
    ensure  => present,
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    source  => "puppet:///modules/${module_name}/mailhog/SuSEfirewall.mailhog-http",
    require => File['/usr/local/bin/mailhog']
  }
  
  service {'mailhog':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    require    => File['/etc/systemd/system/mailhog.service']
  }
  
  exec {'firewall_open_http_mailhog_port':
    command => 'sysconf_addword /etc/sysconfig/SuSEfirewall2 FW_CONFIGURATIONS_EXT mailhog-http',
    unless  => 'grep "mailhog-http" /etc/sysconfig/SuSEfirewall2 | grep "FW_CONFIGURATIONS_EXT"',
    path    => ['/usr/sbin', '/usr/bin'],
    require => [ File['/usr/local/bin/mailhog'], Class['mopensuse::packages::firewall'] ],
    notify  => Class['mopensuse::services::firewall']
  }
  
}
 
