class mopensuse::packages::gui::vlc_qt($ensure = 'present') {

  package {'vlc-qt':
    ensure => $ensure,
    install_options => [ {'--repo' => 'packman'} ]
  }
}
