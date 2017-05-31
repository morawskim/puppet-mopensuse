class mopensuse::packages::tree($ensure = 'present') {
  
  package {['tree']:
    ensure => $ensure,
  }
  
}