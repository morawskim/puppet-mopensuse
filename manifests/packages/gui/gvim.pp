class mopensuse::packages::gui::gvim($ensure = 'present') {

  package {'gvim':
    ensure => $ensure,
  }
}