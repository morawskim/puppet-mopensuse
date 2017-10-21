class mopensuse::rpmkeys::games_tools {

  ensure_resource(
    'rpmkey',
    'games_tools',
    hiera_hash('mopensuse::rpmkeys::games_tools')
  )
}
