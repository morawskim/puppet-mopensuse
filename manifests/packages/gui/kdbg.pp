class mopensuse::packages::gui::kdbg {

  include mopensuse::zypper::repositories::kde_extra

  package {'kdbg':
    ensure  => present,
    require => Class['mopensuse::zypper::repositories::kde_extra']
  }
}

