class mopensuse::packages::gui::vlc-qt {

  package {'vlc-qt':
    ensure => present,
    install_options => [ {'--repo' => 'packman'} ]
  }
}
