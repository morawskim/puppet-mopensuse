class mopensuse::packages::ca-certificates($ensure = 'present') {
  
  package {['ca-certificates']:
    ensure => $ensure,
  }
  
}