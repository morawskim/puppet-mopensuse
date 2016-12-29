class mopensuse::packages::gui::recordmydesktop {

  include mopensuse::zypper::repositories::multimedia_apps

  package {'recordmydesktop':
    ensure  => present,
    install_options => [ {'--from' => 'multimedia_apps'} ],
    require => Class['mopensuse::zypper::repositories::multimedia_apps']
  }

  package {'qt-recordmydesktop':
    ensure => present,
    install_options => [ {'--from' => 'multimedia_apps'} ],
  }
}
