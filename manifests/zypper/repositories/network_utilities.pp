class mopensuse::zypper::repositories::network_utilities {

  include mopensuse::zypper::refresh
  include mopensuse::rpmkeys::network_utilities

  Zypprepo {
    notify => Class['mopensuse::zypper::refresh'],
    require => Class['mopensuse::rpmkeys::network_utilities'],
  }

  ensure_resource(
    'zypprepo',
    'network_utilities',
    hiera_hash('mopensuse::zypper::repositories::network_utilities')
  )
}
