class mopensuse::packages::gui::kup {
  
  include mopensuse::zypper::repositories::kde_kup
  
  package {'kup':
    ensure  => '0.5.1',
    require => Class['mopensuse::zypper::repositories::kde_kup']
  }
  
}

