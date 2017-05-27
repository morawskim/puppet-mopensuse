class mopensuse::packages::gui::chromium {

  include mopensuse::zypper::repositories::packman

  if $::operatingsystemrelease > 13.2 {
    $packagename = 'chromium-ffmpegsumo'
  } else {
    $packagename = 'chromium-ffmpeg'
  }

  package{['chromium', $packagename]:
    ensure  => present,
    require => Class['mopensuse::zypper::repositories::packman']
  }
}
