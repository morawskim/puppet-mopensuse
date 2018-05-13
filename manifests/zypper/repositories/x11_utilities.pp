class mopensuse::zypper::repositories::x11_utilities {

  include mopensuse::zypper::refresh
  include mopensuse::rpmkeys::x11_utilities

  Zypprepo {
    notify  => Class['mopensuse::zypper::refresh'],
    require => Class['mopensuse::rpmkeys::x11_utilities'],
  }

  ensure_resource(
    'zypprepo',
    'x11_utilities',
    hiera_hash('mopensuse::zypper::repositories::x11_utilities')
  )
}
