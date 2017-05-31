class mopensuse::packages::biabam($ensure = 'present') {
  
  package {'biabam':
    ensure => $ensure,
  }
  
}