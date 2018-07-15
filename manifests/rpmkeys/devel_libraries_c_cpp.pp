class mopensuse::rpmkeys::devel_libraries_c_cpp {

  ensure_resource(
    'rpmkey',
    'devel_libraries_c_cpp',
    lookup('mopensuse::rpmkeys')['devel_libraries_c_cpp']
  )
}
