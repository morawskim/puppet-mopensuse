class mopensuse::packages::mycli($ensure = 'present') {

  include mopensuse::zypper::repositories::morawskim
  include mopensuse::zypper::repositories::devel_languages_python

  package {'mycli':
    ensure  => $ensure,
    require => [
      Class['mopensuse::zypper::repositories::morawskim'],
      Class['mopensuse::zypper::repositories::devel_languages_python'],
    ]
  }
}
