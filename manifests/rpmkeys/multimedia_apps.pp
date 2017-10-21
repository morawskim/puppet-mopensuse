class mopensuse::rpmkeys::multimedia_apps {

  ensure_resource(
    'rpmkey',
    'multimedia_apps',
    hiera_hash('mopensuse::rpmkeys::multimedia_apps')
  )
}
