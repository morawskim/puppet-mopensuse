class mopensuse::rpmkeys::games {

  ensure_resource(
    'rpmkey',
    'games',
    lookup('mopensuse::rpmkeys')['games']
  )
}
