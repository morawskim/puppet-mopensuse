class mopensuse::rpmkeys::skype {

  ensure_resource(
    'rpmkey',
    'skype',
    hiera_hash('mopensuse::rpmkeys::skype')
  )
}
