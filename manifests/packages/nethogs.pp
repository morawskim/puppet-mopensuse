class mopensuse::packages::nethogs($ensure = 'present') {
  
  package {'nethogs':
    ensure => $ensure,
  }
  
}