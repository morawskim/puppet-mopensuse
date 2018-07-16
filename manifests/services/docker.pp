class mopensuse::services::docker {
  include mopensuse::packages::docker

  ensure_resource(
    'service',
    'docker',
    lookup('mopensuse::services')['docker']
  )
}
