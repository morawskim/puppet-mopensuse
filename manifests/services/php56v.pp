class mopensuse::services::php56v {
  include mopensuse::packages::php56v

  ensure_resource(
    'service',
    'php56v-fpm',
    lookup('mopensuse::services')['php56v-fpm']
  )
}
