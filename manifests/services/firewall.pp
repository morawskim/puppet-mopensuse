class mopensuse::services::firewall {
  include mopensuse::packages::firewall

  ensure_resource(
    'service',
    'firewalld',
    lookup('mopensuse::services')['firewalld']
  )
}
