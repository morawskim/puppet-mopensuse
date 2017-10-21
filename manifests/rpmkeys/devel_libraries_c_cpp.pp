class mopensuse::rpmkeys::devel_libraries_c_cpp {

  ensure_resource(
    'rpmkey',
    'devel_libraries_c_cpp',
    hiera_hash('mopensuse::rpmkeys::devel_libraries_c_cpp')
  )
}
