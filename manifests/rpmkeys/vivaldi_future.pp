class mopensuse::rpmkeys::vivaldi_future {

  ensure_resource(
    'rpmkey',
    'vivaldi_future',
    lookup('mopensuse::rpmkeys')['vivaldi_future']
  )
}
