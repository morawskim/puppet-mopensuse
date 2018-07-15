class mopensuse::rpmkeys::server_database {

  ensure_resource(
    'rpmkey',
    'server_database',
    lookup('mopensuse::rpmkeys')['server_database']
  )
}
