class mopensuse::rpmkeys::devel_languages_python {

  ensure_resource(
    'rpmkey',
    'devel_languages_python',
    lookup('mopensuse::rpmkeys')['devel_languages_python']
  )
}
