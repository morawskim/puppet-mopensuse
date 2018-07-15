class mopensuse::rpmkeys::server_php_extensions {

  ensure_resource(
    'rpmkey',
    'server_php_extensions',
    lookup('mopensuse::rpmkeys')['server_php_extensions']
  )
}
