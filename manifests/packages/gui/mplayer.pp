class mopensuse::packages::gui::mplayer (
  $ensure = 'present'
) {
  include mopensuse::zypper::repositories::packman

  package { 'MPlayer':
    ensure          => present,
    install_options => [ { '--from' => 'packman' } ],
    require         => Class['mopensuse::zypper::repositories::packman']
  }
}
