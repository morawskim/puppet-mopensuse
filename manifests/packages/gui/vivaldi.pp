class mopensuse::packages::gui::vivaldi {
  
  include mopensuse::zypper::repositories::vivaldi
  
  package{'vivaldi-stable':
    ensure  => present,
    require => Class['mopensuse::zypper::repositories::vivaldi'],
  }
}