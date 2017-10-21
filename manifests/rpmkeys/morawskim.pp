class mopensuse::rpmkeys::morawskim {

  ensure_resource(
    'rpmkey',
    'morawskim',
    hiera_hash('mopensuse::rpmkeys::morawskim')
  )
}
