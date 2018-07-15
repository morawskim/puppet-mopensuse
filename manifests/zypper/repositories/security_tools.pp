class mopensuse::zypper::repositories::security_tools {

  include mopensuse::zypper::refresh
  include mopensuse::rpmkeys::security

  Zypprepo {
    notify  => Class['mopensuse::zypper::refresh'],
    require => Class['mopensuse::rpmkeys::security'],
  }

  ensure_resource(
    'zypprepo',
    'security_tools',
    lookup('mopensuse::zypprepos')['security_tools']
  )
}
