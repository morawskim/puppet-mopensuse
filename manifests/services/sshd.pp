class mopensuse::services::sshd {
  include mopensuse::packages::sshd

  ensure_resource(
    'service',
    'sshd',
    lookup('mopensuse::services')['sshd']
  )
}
