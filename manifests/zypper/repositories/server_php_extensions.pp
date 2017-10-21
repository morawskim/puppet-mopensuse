class mopensuse::zypper::repositories::server_php_extensions {

  include mopensuse::zypper::refresh
  include mopensuse::rpmkeys::server_php_extensions

  Zypprepo {
    notify => Class['mopensuse::zypper::refresh'],
  }

  ensure_resource(
    'zypprepo',
    'server_php_extensions',
    hiera_hash('mopensuse::zypper::repositories::server_php_extensions')
  )
}
