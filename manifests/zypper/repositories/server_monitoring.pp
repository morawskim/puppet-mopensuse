class mopensuse::zypper::repositories::server_monitoring {

  include mopensuse::zypper::refresh
  include mopensuse::rpmkeys::server_monitoring

  Zypprepo {
    notify => Class['mopensuse::zypper::refresh'],
  }

  ensure_resource(
    'zypprepo',
    'server_monitoring',
    hiera_hash('mopensuse::zypper::repositories::server_monitoring')
  )
}
