class mopensuse::rpmkeys::multimedia_apps {

  ensure_resource(
    'rpmkey',
    'multimedia_apps',
    lookup('mopensuse::rpmkeys')['multimedia_apps']
  )
}
