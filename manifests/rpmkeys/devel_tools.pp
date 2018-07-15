class mopensuse::rpmkeys::devel_tools {

  ensure_resource(
    'rpmkey',
    'devel_tools',
    lookup('mopensuse::rpmkeys')['devel_tools']
  )
}
