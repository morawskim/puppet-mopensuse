class mopensuse::zypper::repositories::utilities {

  include mopensuse::zypper::refresh
  include mopensuse::rpmkeys::utilities

  Zypprepo {
    notify  => Class['mopensuse::zypper::refresh'],
    require => Class['mopensuse::rpmkeys::utilities'],
  }

  ensure_resource(
    'zypprepo',
    'utilities',
    hiera_hash('mopensuse::zypper::repositories::utilities')
  )
}
