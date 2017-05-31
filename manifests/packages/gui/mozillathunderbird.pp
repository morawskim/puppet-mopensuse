class mopensuse::packages::gui::mozillathunderbird($ensure = 'present') {

  package {'MozillaThunderbird':
    ensure  => $ensure,
  }

}

