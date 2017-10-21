class mopensuse::rpmkeys::jenkins {

  ensure_resource(
    'rpmkey',
    'jenkins',
    hiera_hash('mopensuse::rpmkeys::jenkins')
  )
}
