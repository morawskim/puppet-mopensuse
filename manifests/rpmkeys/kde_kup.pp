class mopensuse::rpmkeys::kde_kup {

  ensure_resource(
    'rpmkey',
    'kde_kup',
    lookup('mopensuse::rpmkeys')['kde_kup']
  )
}
