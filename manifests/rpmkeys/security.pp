class mopensuse::rpmkeys::security {

  ensure_resource(
    'rpmkey',
    'security',
    hiera_hash('mopensuse::rpmkeys::security')
  )
}
