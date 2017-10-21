class mopensuse::rpmkeys::devel_languages_python {

  ensure_resource(
    'rpmkey',
    'devel_languages_python',
    hiera_hash('mopensuse::rpmkeys::devel_languages_python')
  )
}
