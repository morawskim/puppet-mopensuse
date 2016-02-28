class mopensuse::packages::libguestfs {
  
  package {['libguestfs0', 'guestfs-tools']:
    ensure => present
  }
  
}
