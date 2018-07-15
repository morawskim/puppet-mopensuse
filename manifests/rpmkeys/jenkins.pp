class mopensuse::rpmkeys::jenkins {

  ensure_resource(
    'rpmkey',
    'jenkins',
    lookup('mopensuse::rpmkeys')['jenkins']
  )
}
