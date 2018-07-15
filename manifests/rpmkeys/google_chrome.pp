class mopensuse::rpmkeys::google_chrome {

  ensure_resource(
    'rpmkey',
    'google_chrome',
    lookup('mopensuse::rpmkeys')['google_chrome']
  )
}
