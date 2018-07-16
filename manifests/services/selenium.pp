class mopensuse::services::selenium {
  include mopensuse::packages::selenium

  ensure_resource(
    'service',
    'selenium',
    lookup('mopensuse::services')['selenium']
  )
}
