class mopensuse::packages::gui::chromium {

  include mopensuse::zypper::repositories::packman

  package{['chromium', 'chromium-ffmpeg']:
    ensure  => present,
    require => Class['mopensuse::zypper::repositories::packman']
  }
}