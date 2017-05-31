class mopensuse::packages::gui::pidgin($ensure = 'present') {
  
  package {'pidgin':
    ensure  => $ensure,
  }
  
}

