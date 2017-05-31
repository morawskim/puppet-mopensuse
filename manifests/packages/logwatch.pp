class mopensuse::packages::logwatch($ensure = 'present') {
  
  package {'logwatch':
    ensure  => $ensure,
  }
  
}