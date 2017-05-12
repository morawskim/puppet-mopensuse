class mopensuse::packages::httpie {

  include mopensuse::zypper::repositories::devel-languages-python
  include mopensuse::zypper::repositories::morawskim

  package {'httpie':
    ensure  => present,
    require => [
        Class['mopensuse::zypper::repositories::devel-languages-python']
    ]
  }

  package {'http-prompt':
    ensure  => present,
    require => [
        Class['mopensuse::zypper::repositories::morawskim']
    ]
  }
}