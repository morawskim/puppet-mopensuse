class mopensuse::packages::sensors($ensure = 'present') {
  
  package {['sensors', 'cpupower']:
    ensure => $ensure,
  }
  
}