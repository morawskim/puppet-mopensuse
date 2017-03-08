class mopensuse::packages::mycli {

  include mopensuse::zypper::repositories::morawskim
  include mopensuse::zypper::repositories::devel_languages_python3

  package {'mycli':
    ensure  => present,
    require => [
      Class['mopensuse::zypper::repositories::morawskim'],
      Class['mopensuse::zypper::repositories::devel_languages_python3'],
    ]
  }
}