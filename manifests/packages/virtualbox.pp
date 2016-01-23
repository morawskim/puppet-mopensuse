class mopensuse::packages::virtualbox {
  
  package {['virtualbox']:
    ensure => present
  }
  
  #todo mmo add user to group vboxusers
}