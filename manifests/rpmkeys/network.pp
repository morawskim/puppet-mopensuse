class mopensuse::rpmkeys::network {

  ensure_resource(
    'rpmkey',
    'network',
    hiera_hash('mopensuse::rpmkeys::network')
  )
}
