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
}
