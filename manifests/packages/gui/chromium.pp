class mopensuse::packages::gui::chromium($ensure = 'present') {

  include mopensuse::zypper::repositories::packman
  include mopensuse::packages::gui::chromium_ffmpeg_extra

  package{'chromium':
    ensure  => present,
    require => Class['mopensuse::zypper::repositories::packman']
  }
}
