class mopensuse::zypper::repositories::libdvdcss {

  include mopensuse::zypper::refresh
  include mopensuse::rpmkeys::libdvdcss

  Zypprepo {
    notify  => Class['mopensuse::zypper::refresh'],
    require => Class['mopensuse::rpmkeys::libdvdcss'],
  }

  ensure_resource(
    'zypprepo',
    'libdvdcss',
    lookup('mopensuse::zypprepos')['libdvdcss']
  )
}
