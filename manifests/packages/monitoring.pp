class mopensuse::packages::monitoring {
  
  package {['iotop', 'htop']:
    ensure => present
  }
  
}