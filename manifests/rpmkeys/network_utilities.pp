class mopensuse::rpmkeys::network_utilities {

  ensure_resource(
    'rpmkey',
    'network_utilities',
    hiera_hash('mopensuse::rpmkeys::network_utilities')
  )
}
