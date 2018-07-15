class mopensuse::rpmkeys::devel_languages_ruby_extensions {

  ensure_resource(
    'rpmkey',
    'devel_languages_ruby_extensions',
    lookup('mopensuse::rpmkeys')['devel_languages_ruby_extensions']
  )
}
