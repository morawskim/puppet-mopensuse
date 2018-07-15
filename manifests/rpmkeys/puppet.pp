class mopensuse::rpmkeys::puppet {

  ensure_resource(
    'rpmkey',
    'puppet',
    lookup('mopensuse::rpmkeys')['puppet']
  )
}
