class mopensuse::packages::gui::four_pane {

  include mopensuse::zypper::repositories::x11_utilities

  package {'4pane':
    ensure  => present,
    require => Class['mopensuse::zypper::repositories::x11_utilities']
  }
}
