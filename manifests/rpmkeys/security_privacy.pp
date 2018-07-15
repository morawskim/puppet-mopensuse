class mopensuse::rpmkeys::security_privacy {

  ensure_resource(
    'rpmkey',
    'security_privacy',
    lookup('mopensuse::rpmkeys')['security_privacy']
  )
}
