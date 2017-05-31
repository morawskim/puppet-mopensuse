class mopensuse::packages::nfs($ensure = 'present') {
  
  package {['nfs-client']:
    ensure => $ensure,
  }
  
}