class mopensuse::rpmkeys::libdvdcss {

  ensure_resource(
    'rpmkey',
    'libdvdcss',
    hiera_hash('mopensuse::rpmkeys::libdvdcss')
  )
}
