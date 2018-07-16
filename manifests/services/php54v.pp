class mopensuse::services::php54v {
  include mopensuse::packages::php54v

  ensure_resource(
    'service',
    'php54v-fpm',
    lookup('mopensuse::services')['php54v-fpm']
  )
}
