class mopensuse::packages::nfs {
  
  package {['nfs-client', 'nfs-kernel-server']:
    ensure => present
  }
  
}