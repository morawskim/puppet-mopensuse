class mopensuse::packages::srm($ensure = 'present') {
  
  package {'srm':
    ensure => $ensure,
  }
  
}