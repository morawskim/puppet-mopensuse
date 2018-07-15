class mopensuse::rpmkeys::filesystems {

  ensure_resource(
    'rpmkey',
    'filesystems',
    lookup('mopensuse::rpmkeys')['filesystems']
  )
}
