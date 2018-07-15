class mopensuse::rpmkeys::kde_frameworks5 {

  ensure_resource(
    'rpmkey',
    'kde_frameworks5',
    lookup('mopensuse::rpmkeys')['kde_frameworks5']
  )
}
