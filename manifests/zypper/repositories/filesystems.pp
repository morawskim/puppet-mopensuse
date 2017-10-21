class mopensuse::zypper::repositories::filesystems {

  include mopensuse::zypper::refresh
  include mopensuse::rpmkeys::filesystems

  Zypprepo {
    notify => Class['mopensuse::zypper::refresh'],
  }

  ensure_resource(
    'zypprepo',
    'filesystems',
    hiera_hash('mopensuse::zypper::repositories::filesystems')
  )
}
