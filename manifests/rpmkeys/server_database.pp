class mopensuse::rpmkeys::server_database {

  ensure_resource(
    'rpmkey',
    'server_database',
    hiera_hash('mopensuse::rpmkeys::server_database')
  )
}
