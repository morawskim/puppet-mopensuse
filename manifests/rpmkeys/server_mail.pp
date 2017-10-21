class mopensuse::rpmkeys::server_mail {

  ensure_resource(
    'rpmkey',
    'server_mail',
    hiera_hash('mopensuse::rpmkeys::server_mail')
  )
}
