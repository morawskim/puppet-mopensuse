class mopensuse::rpmkeys::libdvdcss {

  ensure_resource(
    'rpmkey',
    'libdvdcss',
    lookup('mopensuse::rpmkeys')['libdvdcss']
  )
}
