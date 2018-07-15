class mopensuse::rpmkeys::games_tools {

  ensure_resource(
    'rpmkey',
    'games_tools',
    lookup('mopensuse::rpmkeys')['games_tools']
  )
}
