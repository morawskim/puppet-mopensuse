class mopensuse::packages::gui::gitg($ensure = 'present') {

  package {'gitg':
    ensure => $ensure,
  }
}