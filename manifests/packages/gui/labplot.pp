class mopensuse::packages::gui::labplot {

  include mopensuse::zypper::repositories::kde_extra

  package {'labplot':
    ensure  => present,
    require => Class['mopensuse::zypper::repositories::kde_extra']
  }
}

