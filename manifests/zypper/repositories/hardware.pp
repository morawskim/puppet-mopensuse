class mopensuse::zypper::repositories::hardware {

  include mopensuse::zypper::refresh
  include mopensuse::rpmkeys::hardware

  Zypprepo {
    notify => Class['mopensuse::zypper::refresh'],
  }

  ensure_resource(
    'zypprepo',
    'hardware',
    hiera_hash('mopensuse::zypper::repositories::hardware')
  )
}
