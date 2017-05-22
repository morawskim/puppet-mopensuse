class mopensuse::packages::gui::glogg {

  include mopensuse::zypper::repositories::kde_extra

  package {'glogg':
    ensure  => present,
    require => Class['mopensuse::zypper::repositories::kde_extra']
  }
}

