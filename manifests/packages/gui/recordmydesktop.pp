class mopensuse::packages::gui::recordmydesktop (
  $ensure = 'present'
) {
  include mopensuse::zypper::repositories::multimedia_apps
  include mopensuse::packages::gui::xwininfo

  package { 'recordmydesktop':
    ensure          => $ensure,
    install_options => [ { '--from' => 'multimedia_apps' } ],
    require         => Class['mopensuse::zypper::repositories::multimedia_apps']
  }

  package { 'qt-recordmydesktop':
    ensure          => $ensure,
    install_options => [ { '--from' => 'multimedia_apps' } ],
    require         => Class['mopensuse::zypper::repositories::multimedia_apps']
  }
}
