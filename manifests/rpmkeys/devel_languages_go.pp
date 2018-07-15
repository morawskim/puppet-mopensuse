class mopensuse::rpmkeys::devel_languages_go {

  ensure_resource(
    'rpmkey',
    'devel_languages_go',
    lookup('mopensuse::rpmkeys')['devel_languages_go']
  )
}
