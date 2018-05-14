class mopensuse::packages::git_server (
  $ensure = 'present'
) {
  include mopensuse::packages::vcs
  include mopensuse::packages::firewall
  include mopensuse::services::git_daemon
  include mopensuse::config::git_server

  package { 'git-daemon':
    ensure => $ensure,
  }

  file { '/srv/git':
    ensure => directory,
    mode   => '0755',
    owner  => 'root',
    group  => 'root',
  }

  exec { 'firewall_open_git_daemn_server_port':
    command => 'sysconf_addword /etc/sysconfig/SuSEfirewall2 FW_CONFIGURATIONS_EXT git-daemon',
    unless  => 'grep "git-daemon" /etc/sysconfig/SuSEfirewall2 | grep "FW_CONFIGURATIONS_EXT"',
    path    => ['/usr/sbin', '/usr/bin'],
    require => [ Package['git-daemon'], Class['mopensuse::packages::firewall'] ]
  }
}
