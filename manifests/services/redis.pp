class mopensuse::services::redis {
  include mopensuse::packages::redis

  ensure_resource(
    'service',
    'redis@default',
    lookup('mopensuse::services')['redis@default']
  )
}
