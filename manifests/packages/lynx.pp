class mopensuse::packages::lynx($ensure = 'present') {
  
  package {['lynx']:
    ensure => $ensure,
  }
  
}