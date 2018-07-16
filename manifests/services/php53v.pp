class mopensuse::services::php53v {
  include mopensuse::packages::php53v

  ensure_resource(
    'service',
    'php53v-fpm',
    lookup('mopensuse::services')['php53v-fpm']
  )
}
