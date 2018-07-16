class mopensuse::services::cups {
  include mopensuse::packages::cups

  ensure_resource(
    'service',
    'cups',
    lookup('mopensuse::services')['cups']
  )
}
