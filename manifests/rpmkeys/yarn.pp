class mopensuse::rpmkeys::yarn {

  ensure_resource(
    'rpmkey',
    'yarn',
    lookup('mopensuse::rpmkeys')['yarn']
  )
}
