class mopensuse::packages::gui::gnome_disk_utility($ensure = 'present') {

  package {'gnome-disk-utility':
    ensure => $ensure,
  }
}
