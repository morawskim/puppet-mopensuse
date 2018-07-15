class mopensuse::rpmkeys::slack {

  ensure_resource(
    'rpmkey',
    'slack',
    lookup('mopensuse::rpmkeys')['slack']
  )
}
