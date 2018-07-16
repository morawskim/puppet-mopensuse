class mopensuse::services::php55v {
  include mopensuse::packages::php55v

  ensure_resource(
    'service',
    'php55v-fpm',
    lookup('mopensuse::services')['php55v-fpm']
  )
}
