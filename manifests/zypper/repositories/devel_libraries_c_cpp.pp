class mopensuse::zypper::repositories::devel_libraries_c_cpp {

  include mopensuse::zypper::refresh
  include mopensuse::rpmkeys::devel_libraries_c_cpp

  Zypprepo {
    notify => Class['mopensuse::zypper::refresh'],
  }

  ensure_resource(
    'zypprepo',
    'devel_libraries_c_cpp',
    hiera_hash('mopensuse::zypper::repositories::devel_libraries_c_cpp')
  )
}
