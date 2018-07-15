class mopensuse::zypper::repositories::security_privacy {

  include mopensuse::zypper::refresh
  include mopensuse::rpmkeys::security_privacy

  Zypprepo {
    notify  => Class['mopensuse::zypper::refresh'],
    require => Class['mopensuse::rpmkeys::security_privacy'],
  }

  ensure_resource(
    'zypprepo',
    'security_privacy',
    lookup('mopensuse::zypprepos')['security_privacy']
  )
}
