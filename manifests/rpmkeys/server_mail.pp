class mopensuse::rpmkeys::server_mail {

  ensure_resource(
    'rpmkey',
    'server_mail',
    lookup('mopensuse::rpmkeys')['server_mail']
  )
}
