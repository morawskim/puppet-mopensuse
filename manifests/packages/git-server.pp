class mopensuse::packages::git-server {
  
  include mopensuse::packages::vcs
  include mopensuse::packages::firewall
  
  package {'git-daemon':
      ensure => present
  }
  
  file {'/srv/git':
      ensure  => directory,
      mode    => '0755',
      owner   => 'root',
      group   => 'root',
  }
  
  service {'git-daemon':
      ensure     => running,
      enable     => true,
      hasrestart => true,
      hasstatus  => true,
      require    => Package['git-daemon']
  }
  
  exec {'firewall_open_git_daemn_server_port':
      command => 'sysconf_addword /etc/sysconfig/SuSEfirewall2 FW_CONFIGURATIONS_EXT git-daemon',
      unless  => 'grep "git-daemon" /etc/sysconfig/SuSEfirewall2 | grep "FW_CONFIGURATIONS_EXT"',
      path    => ['/usr/sbin', '/usr/bin'],
      require => [ Package['git-daemon'], Class['mopensuse::packages::firewall'] ]
  }
}