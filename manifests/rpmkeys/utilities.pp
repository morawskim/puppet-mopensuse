class mopensuse::rpmkeys::utilities {

  ensure_resource(
    'rpmkey',
    'utilities',
    lookup('mopensuse::rpmkeys')['utilities']
  )
}
