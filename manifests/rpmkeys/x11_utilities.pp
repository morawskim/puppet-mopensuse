class mopensuse::rpmkeys::x11_utilities {

  ensure_resource(
    'rpmkey',
    'x11_utilities',
    lookup('mopensuse::rpmkeys')['x11_utilities']
  )
}
