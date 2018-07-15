class mopensuse::zypper::repositories::hardware {

  include mopensuse::zypper::refresh
  include mopensuse::rpmkeys::hardware

  Zypprepo {
    notify  => Class['mopensuse::zypper::refresh'],
    require => Class['mopensuse::rpmkeys::hardware'],
  }

  ensure_resource(
    'zypprepo',
    'hardware',
    lookup('mopensuse::zypprepos')['hardware']
  )
}
