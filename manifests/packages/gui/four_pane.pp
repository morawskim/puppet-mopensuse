class mopensuse::packages::gui::four_pane (
  $ensure = 'present'
) {
  include mopensuse::zypper::repositories::x11_utilities

  package { '4pane':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::x11_utilities']
  }
}
