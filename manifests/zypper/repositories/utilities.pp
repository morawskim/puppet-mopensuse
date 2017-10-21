class mopensuse::zypper::repositories::utilities {

  include mopensuse::zypper::refresh
  include mopensuse::rpmkeys::utilities

  Zypprepo {
    notify => Class['mopensuse::zypper::refresh'],
  }

  ensure_resource(
    'zypprepo',
    'utilities',
    hiera_hash('mopensuse::zypper::repositories::utilities')
  )
}
