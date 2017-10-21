class mopensuse::rpmkeys::education {

  ensure_resource(
    'rpmkey',
    'education',
    hiera_hash('mopensuse::rpmkeys::education')
  )
}
