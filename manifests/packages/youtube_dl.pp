class mopensuse::packages::youtube_dl (
  $ensure = 'present'
) {
  include mopensuse::zypper::repositories::packman

  package { 'youtube-dl':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::packman']
  }
}
