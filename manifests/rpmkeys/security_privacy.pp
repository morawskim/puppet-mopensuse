class mopensuse::rpmkeys::security_privacy {

  ensure_resource(
    'rpmkey',
    'security_privacy',
    hiera_hash('mopensuse::rpmkeys::security_privacy')
  )
}
