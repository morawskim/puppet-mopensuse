class mopensuse::packages::gui::krunner_kopetecontacts {

 include mopensuse::zypper::repositories::morawskim

  package {'krunner-kopetecontacts':
    ensure  => present,
    require => [
        Class['mopensuse::zypper::repositories::morawskim'],
    ]
  }
}
