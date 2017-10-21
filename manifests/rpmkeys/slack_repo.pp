class mopensuse::rpmkeys::slack_repo {

  ensure_resource(
    'rpmkey',
    'slack_repo',
    hiera_hash('mopensuse::rpmkeys::slack_repo')
  )
}
