class mopensuse::packages::gui::retext($ensure = 'present') {

  package {'retext':
    ensure => $ensure,
  }
}