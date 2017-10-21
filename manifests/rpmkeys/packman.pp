class mopensuse::rpmkeys::packman {

  ensure_resource(
    'rpmkey',
    'packman',
    hiera_hash('mopensuse::rpmkeys::packman')
  )
}
