class mopensuse::packages::gui::mysql-workbench($ensure = 'present') {
  
  package {'mysql-workbench':
    ensure  => $ensure,
  }
  
}

