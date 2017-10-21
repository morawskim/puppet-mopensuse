class mopensuse::zypper::repositories::security {

  include mopensuse::zypper::refresh
  include mopensuse::rpmkeys::security

  Zypprepo {
    notify => Class['mopensuse::zypper::refresh'],
  }

  ensure_resource(
    'zypprepo',
    'security',
    hiera_hash('mopensuse::zypper::repositories::security')
  )
}
