class mopensuse::rpmkeys::devel_tools {

  ensure_resource(
    'rpmkey',
    'devel_tools',
    hiera_hash('mopensuse::rpmkeys::devel_tools')
  )
}
