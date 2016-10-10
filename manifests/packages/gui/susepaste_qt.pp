class mopensuse::packages::gui::susepaste_qt {

  include mopensuse::zypper::repositories::morawskim

  package {'susepaste-qt':
    ensure  => present,
    require => Class['mopensuse::zypper::repositories::morawskim']
  }
}

