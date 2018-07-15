class mopensuse::rpmkeys::packman {

  ensure_resource(
    'rpmkey',
    'packman',
    lookup('mopensuse::rpmkeys')['packman']
  )
}
