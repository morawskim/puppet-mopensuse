class mopensuse::rpmkeys::games {

  ensure_resource(
    'rpmkey',
    'games',
    hiera_hash('mopensuse::rpmkeys::games')
  )
}
