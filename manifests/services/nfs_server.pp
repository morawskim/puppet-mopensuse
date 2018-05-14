class mopensuse::services::nfs_server {
  include mopensuse::packages::nfs_server

  service { 'nfsserver':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    require    => Class['mopensuse::packages::nfs_server'],
  }
}
