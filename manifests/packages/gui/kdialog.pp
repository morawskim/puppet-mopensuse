class mopensuse::packages::gui::kdialog($ensure = 'present') {

  package {'kdialog':
    ensure  => $ensure,
  }
}
