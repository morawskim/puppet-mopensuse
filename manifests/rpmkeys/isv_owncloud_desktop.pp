class mopensuse::rpmkeys::isv_owncloud_desktop {

  ensure_resource(
    'rpmkey',
    'isv_owncloud_desktop',
    lookup('mopensuse::rpmkeys')['isv_owncloud_desktop']
  )
}
