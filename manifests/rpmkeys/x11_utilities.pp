class mopensuse::rpmkeys::x11_utilities {

  ensure_resource(
    'rpmkey',
    'x11_utilities',
    hiera_hash('mopensuse::rpmkeys::x11_utilities')
  )
}
