class mopensuse::packages::daps($ensure = 'present') {
  
    package {'daps':
    ensure => $ensure,
  }
  
}