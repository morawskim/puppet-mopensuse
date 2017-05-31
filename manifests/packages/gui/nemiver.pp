class mopensuse::packages::gui::nemiver($ensure = 'present') {

  package {'nemiver':
    ensure => $ensure,
  }
}