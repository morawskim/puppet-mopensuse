class mopensuse::zypper::repositories::libdvdcss {

  include mopensuse::zypper::refresh
  include mopensuse::rpmkeys::libdvdcss

  Zypprepo {
    notify => Class['mopensuse::zypper::refresh'],
  }

  ensure_resource(
    'zypprepo',
    'libdvdcss',
    hiera_hash('mopensuse::zypper::repositories::libdvdcss')
  )
}
