class mopensuse::rpmkeys::server_php_extensions {

  ensure_resource(
    'rpmkey',
    'server_php_extensions',
    hiera_hash('mopensuse::rpmkeys::server_php_extensions')
  )
}
