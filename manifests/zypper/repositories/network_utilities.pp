class mopensuse::zypper::repositories::network_utilities {

  include mopensuse::zypper::refresh
  include mopensuse::rpmkeys::network_utilities

  Zypprepo {
    notify => Class['mopensuse::zypper::refresh'],
  }

  ensure_resource(
    'zypprepo',
    'network_utilities',
    hiera_hash('mopensuse::zypper::repositories::network_utilities')
  )
}
