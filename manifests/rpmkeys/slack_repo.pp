class mopensuse::rpmkeys::slack_repo {

  ensure_resource(
    'rpmkey',
    'slack_repo',
    lookup('mopensuse::rpmkeys')['slack_repo']
  )
}
