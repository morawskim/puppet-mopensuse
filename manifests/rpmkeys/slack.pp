class mopensuse::rpmkeys::slack {

  ensure_resource(
    'rpmkey',
    'slack',
    hiera_hash('mopensuse::rpmkeys::slack')
  )
}
