class mopensuse::services::nullmailer {
  include mopensuse::packages::nullmailer

  ensure_resource(
    'service',
    'nullmailer',
    lookup('mopensuse::services')['nullmailer']
  )
}
