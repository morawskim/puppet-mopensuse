class mopensuse::zypper::repositories::security {

  include mopensuse::zypper::refresh
  include mopensuse::rpmkeys::security

  Zypprepo {
    notify  => Class['mopensuse::zypper::refresh'],
    require => Class['mopensuse::rpmkeys::security'],
  }

  ensure_resource(
    'zypprepo',
    'security',
    lookup('mopensuse::zypprepos')['security']
  )
}
