class mopensuse::packages::gui::mplayer {

  include mopensuse::zypper::repositories::packman

  package{'MPlayer':
    ensure          => present,
    install_options => [ {'--from' => 'packman'} ],
    require         => Class['mopensuse::zypper::repositories::packman']
  }
}
