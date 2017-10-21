class mopensuse::rpmkeys::utilities {

  ensure_resource(
    'rpmkey',
    'utilities',
    hiera_hash('mopensuse::rpmkeys::utilities')
  )
}
