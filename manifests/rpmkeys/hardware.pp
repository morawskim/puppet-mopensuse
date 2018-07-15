class mopensuse::rpmkeys::hardware {

  ensure_resource(
    'rpmkey',
    'hardware',
    lookup('mopensuse::rpmkeys')['hardware']
  )
}
