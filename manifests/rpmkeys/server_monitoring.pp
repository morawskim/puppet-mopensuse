class mopensuse::rpmkeys::server_monitoring {

  ensure_resource(
    'rpmkey',
    'server_monitoring',
    hiera_hash('mopensuse::rpmkeys::server_monitoring')
  )
}
