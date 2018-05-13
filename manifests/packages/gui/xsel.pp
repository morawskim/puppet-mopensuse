class mopensuse::packages::gui::xsel (
  $ensure = 'present'
) {
  include mopensuse::zypper::repositories::x11_utilities

  package { 'xsel':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::x11_utilities']
  }
}
