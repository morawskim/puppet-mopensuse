class mopensuse::packages::procps($ensure = 'present') {
  
  package {'procps':
    ensure => $ensure,
  }
  
}