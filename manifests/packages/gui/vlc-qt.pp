class mopensuse::packages::gui::vlc-qt($ensure = 'present') {

  package {'vlc-qt':
    ensure => $ensure,
    install_options => [ {'--repo' => 'packman'} ]
  }
}
