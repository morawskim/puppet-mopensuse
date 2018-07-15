class mopensuse::rpmkeys::security {

  ensure_resource(
    'rpmkey',
    'security',
    lookup('mopensuse::rpmkeys')['security']
  )
}
