class mopensuse::rpmkeys::network {

  ensure_resource(
    'rpmkey',
    'network',
    lookup('mopensuse::rpmkeys')['network']
  )
}
