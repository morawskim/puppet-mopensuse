class mopensuse::packages::gui::flash_player($ensure = 'present') {

  include mopensuse::zypper::repositories::packman

  package {'flash-player':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::packman']
  }
}
