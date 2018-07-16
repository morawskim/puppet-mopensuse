class mopensuse::services::apache2 {
  include mopensuse::packages::apache2

  ensure_resource(
    'service',
    'apache2',
    lookup('mopensuse::services')['apache2']
  )
}
