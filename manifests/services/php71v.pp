class mopensuse::services::php71v {
  include mopensuse::packages::php71v

  ensure_resource(
    'service',
    'php71v-fpm',
    lookup('mopensuse::services')['php71v-fpm']
  )
}
