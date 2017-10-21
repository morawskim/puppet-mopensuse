class mopensuse::zypper::repositories::server_database {

  include mopensuse::zypper::refresh
  include mopensuse::rpmkeys::server_database

  Zypprepo {
    notify => Class['mopensuse::zypper::refresh'],
    require => Class['mopensuse::rpmkeys::server_database'],
  }

  ensure_resource(
    'zypprepo',
    'server_database',
    hiera_hash('mopensuse::zypper::repositories::server_database')
  )
}
