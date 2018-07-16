class mopensuse::services::mailhog {
  include mopensuse::packages::mailhog

  ensure_resource(
    'service',
    'mailhog',
    lookup('mopensuse::services')['mailhog']
  )
}
