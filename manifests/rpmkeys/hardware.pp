class mopensuse::rpmkeys::hardware {

  ensure_resource(
    'rpmkey',
    'hardware',
    hiera_hash('mopensuse::rpmkeys::hardware')
  )
}
