class mopensuse::packages::gui::chromium {

  include mopensuse::zypper::repositories::packman

  package{'chromium':
    ensure  => present,
    require => Class['mopensuse::zypper::repositories::packman']
  }
}
