class mopensuse::rpmkeys::isv_owncloud_desktop {

  ensure_resource(
    'rpmkey',
    'isv_owncloud_desktop',
    hiera_hash('mopensuse::rpmkeys::isv_owncloud_desktop')
  )
}
