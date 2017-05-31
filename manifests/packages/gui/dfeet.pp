class mopensuse::packages::gui::dfeet($ensure = 'present') {

  package {'d-feet':
    ensure => $ensure,
  }
}