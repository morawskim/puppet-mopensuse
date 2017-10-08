class mopensuse::packages::gui::mysql_workbench($ensure = 'present') {
  
  package {'mysql-workbench':
    ensure  => $ensure,
  }
  
}

