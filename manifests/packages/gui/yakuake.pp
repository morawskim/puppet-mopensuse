class mopensuse::packages::gui::yakuake($ensure = 'present') {
  
  package {'yakuake':
    ensure  => $ensure,
  }
  
}

