class mopensuse::rpmkeys::kde_extra {

  ensure_resource(
    'rpmkey',
    'kde_extra',
    lookup('mopensuse::rpmkeys')['kde_extra']
  )
}
