class mopensuse::packages::gui::susepaste-screenshot($ensure = 'present') {
  
  package {['susepaste-screenshot']:
    ensure => $ensure,
  }
  
}