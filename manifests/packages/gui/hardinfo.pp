class mopensuse::packages::gui::hardinfo($ensure = 'present') {
  
  package {['hardinfo']:
    ensure => $ensure,
  }
  
}
 
