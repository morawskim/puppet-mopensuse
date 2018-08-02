class mopensuse::services::snapd {

  ensure_resource(
    'service',
    'snapd',
    lookup('mopensuse::services')['snapd']
  )
}
