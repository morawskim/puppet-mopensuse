class mopensuse::rpmkeys::devel_languages_rust {

  ensure_resource(
    'rpmkey',
    'devel_languages_rust',
    hiera_hash('mopensuse::rpmkeys::devel_languages_rust')
  )
}
