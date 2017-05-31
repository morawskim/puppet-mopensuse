class mopensuse::packages::gui::glade($ensure = 'present') {

  package {'glade':
    ensure => $ensure,
  }
}