class mopensuse::rpmkeys::devel_languages_rust {

  ensure_resource(
    'rpmkey',
    'devel_languages_rust',
    lookup('mopensuse::rpmkeys')['devel_languages_rust']
  )
}
