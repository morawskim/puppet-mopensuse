class mopensuse::rpmkeys::filesystems {

  ensure_resource(
    'rpmkey',
    'filesystems',
    hiera_hash('mopensuse::rpmkeys::filesystems')
  )
}
