class mopensuse::packages::gui::xbindkeys($ensure = 'present') {

  package {'xbindkeys':
    ensure  => $ensure,
  }
}
