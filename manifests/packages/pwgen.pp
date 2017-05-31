class mopensuse::packages::pwgen($ensure = 'present') {
  
  package {['pwgen']:
    ensure => $ensure,
  }
  
}