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
    lookup('mopensuse::zypprepos')['utilities']
  )
}
