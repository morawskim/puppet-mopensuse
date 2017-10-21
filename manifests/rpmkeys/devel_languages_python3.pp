class mopensuse::rpmkeys::devel_languages_python3 {

  ensure_resource(
    'rpmkey',
    'devel_languages_python3',
    hiera_hash('mopensuse::rpmkeys::devel_languages_python3')
  )
}
