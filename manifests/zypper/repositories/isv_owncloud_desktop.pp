class mopensuse::zypper::repositories::isv_owncloud_desktop {

  include mopensuse::zypper::refresh
  include mopensuse::rpmkeys::isv_owncloud_desktop

  Zypprepo {
    notify  => Class['mopensuse::zypper::refresh'],
    require => Class['mopensuse::rpmkeys::isv_owncloud_desktop'],
  }

  ensure_resource(
    'zypprepo',
    'isv_owncloud_desktop',
    lookup('mopensuse::zypprepos')['isv_owncloud_desktop']
  )
}
