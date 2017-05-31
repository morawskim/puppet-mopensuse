class mopensuse::packages::gui::wireshark-qt($ensure = 'present') {
  
  package {'wireshark-ui-qt':
    ensure  => $ensure,
  }
  
}


