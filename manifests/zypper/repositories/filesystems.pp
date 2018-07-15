class mopensuse::zypper::repositories::filesystems {

  include mopensuse::zypper::refresh
  include mopensuse::rpmkeys::filesystems

  Zypprepo {
    notify  => Class['mopensuse::zypper::refresh'],
    require => Class['mopensuse::rpmkeys::filesystems'],
  }

  ensure_resource(
    'zypprepo',
    'filesystems',
    lookup('mopensuse::zypprepos')['filesystems']
  )
}
