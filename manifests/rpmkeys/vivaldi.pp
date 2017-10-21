class mopensuse::rpmkeys::vivaldi {

  ensure_resource(
    'rpmkey',
    'vivaldi',
    hiera_hash('mopensuse::rpmkeys::vivaldi')
  )
}
