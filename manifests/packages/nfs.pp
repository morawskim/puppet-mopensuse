class mopensuse::packages::nfs {
  
  package {['nfs-client']:
    ensure => present
  }
  
}