class mopensuse::packages::gui::xwininfo($ensure = 'present') {

  package {'xwininfo':
    ensure  => $ensure,
  }
}

