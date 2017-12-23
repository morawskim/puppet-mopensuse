class mopensuse::rpmkeys::yarn {

  ensure_resource(
    'rpmkey',
    'yarn',
    hiera_hash('mopensuse::rpmkeys::yarn')
  )
}
