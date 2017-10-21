class mopensuse::rpmkeys::vivaldi_future {

  ensure_resource(
    'rpmkey',
    'vivaldi_future',
    hiera_hash('mopensuse::rpmkeys::vivaldi_future')
  )
}
