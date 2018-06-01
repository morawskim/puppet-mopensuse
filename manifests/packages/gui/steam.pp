class mopensuse::packages::gui::steam (
  $ensure = 'present'
) {
  include mopensuse::zypper::repositories::games_tools
  include mopensuse::packages::firewall
  include mopensuse::config::steam

  package { 'steam':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::games_tools']
  }
}
