class mopensuse::packages::git-server($ensure = 'present') {

  include mopensuse::packages::vcs
  include mopensuse::packages::firewall

  package {'git-daemon':
      ensure => $ensure,
  }

  file {'/srv/git':
      ensure  => directory,
      mode    => '0755',
      owner   => 'root',
      group   => 'root',
  }

  create_resources(
    'file',
    hiera_hash('git_daemon_paths'),
    {'ensure' => 'directory', 'require' => File['/srv/git']}
  )

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
