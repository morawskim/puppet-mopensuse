class mopensuse::zypper::repositories::server_monitoring {

  include mopensuse::zypper::refresh
  include mopensuse::rpmkeys::server_monitoring

  Zypprepo {
    notify  => Class['mopensuse::zypper::refresh'],
    require => Class['mopensuse::rpmkeys::server_monitoring'],
  }

  ensure_resource(
    'zypprepo',
    'server_monitoring',
    lookup('mopensuse::zypprepos')['server_monitoring']
  )
}
