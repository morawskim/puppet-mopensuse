class mopensuse::services::git_daemon {
  include mopensuse::packages::git_server

  service { 'git-daemon':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    require    => Class['mopensuse::packages::git_server'],
  }
}
