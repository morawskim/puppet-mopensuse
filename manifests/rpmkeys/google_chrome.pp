class mopensuse::rpmkeys::google_chrome {

  ensure_resource(
    'rpmkey',
    'google_chrome',
    hiera_hash('mopensuse::rpmkeys::google_chrome')
  )
}
