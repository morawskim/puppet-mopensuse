class mopensuse::rpmkeys::server_monitoring {

  ensure_resource(
    'rpmkey',
    'server_monitoring',
    lookup('mopensuse::rpmkeys')['server_monitoring']
  )
}
