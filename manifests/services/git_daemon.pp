class mopensuse::services::git_daemon {
  include mopensuse::packages::git_server

  ensure_resource(
    'service',
    'git-daemon',
    lookup('mopensuse::services')['git-daemon']
  )
}
