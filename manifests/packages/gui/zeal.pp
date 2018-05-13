class mopensuse::packages::gui::zeal (
  $ensure = 'present'
) {
  include mopensuse::zypper::repositories::devel_tools

  package { 'zeal':
    ensure  => $ensure,
    require => Zypprepo['devel_tools']
  }
}
