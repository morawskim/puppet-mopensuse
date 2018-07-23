class mopensuse::services::mongodb {
  ensure_resource(
    'service',
    'mongodb',
    lookup('mopensuse::services')['mongodb']
  )
}
