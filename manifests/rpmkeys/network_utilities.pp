class mopensuse::rpmkeys::network_utilities {

  ensure_resource(
    'rpmkey',
    'network_utilities',
    lookup('mopensuse::rpmkeys')['network_utilities']
  )
}
