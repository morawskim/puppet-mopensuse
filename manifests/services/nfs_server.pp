class mopensuse::services::nfs_server {
  include mopensuse::packages::nfs_server

  ensure_resource(
    'service',
    'nfsserver',
    lookup('mopensuse::services')['nfsserver']
  )
}
