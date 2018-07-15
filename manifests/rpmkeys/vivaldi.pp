class mopensuse::rpmkeys::vivaldi {

  ensure_resource(
    'rpmkey',
    'vivaldi',
    lookup('mopensuse::rpmkeys')['vivaldi']
  )
}
