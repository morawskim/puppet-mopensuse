class mopensuse::packages::gui::skrooge {
  
  include mopensuse::zypper::repositories::kde_extra
  
  package {'skrooge':
    ensure  => present,
    require => Class['mopensuse::zypper::repositories::kde_extra']
  }
  
}

