class mopensuse::rpmkeys::devel_languages_go {

  ensure_resource(
    'rpmkey',
    'devel_languages_go',
    hiera_hash('mopensuse::rpmkeys::devel_languages_go')
  )
}
