class mopensuse::packages::gui::virtualbox-qt($ensure = 'present') {
  
  package {'virtualbox-qt':
    ensure  => $ensure,
  }
  
}

