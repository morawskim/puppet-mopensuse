class mopensuse::services::php70v {
  include mopensuse::packages::php70v

  ensure_resource(
    'service',
    'php70v-fpm',
    lookup('mopensuse::services')['php70v-fpm']
  )
}
