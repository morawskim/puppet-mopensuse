class mopensuse::packages::gui::pgadmin($ensure = 'present') {
  
  package {'pgadmin3':
    ensure  => $ensure,
  }
  
}

