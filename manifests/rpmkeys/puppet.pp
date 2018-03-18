class mopensuse::rpmkeys::puppet {

  ensure_resource(
    'rpmkey',
    'puppet',
    hiera_hash('mopensuse::rpmkeys::puppet')
  )
}
