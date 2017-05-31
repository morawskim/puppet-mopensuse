class mopensuse::packages::httpie($ensure = 'present') {

  include mopensuse::zypper::repositories::devel-languages-python
  include mopensuse::zypper::repositories::morawskim

  package {'httpie':
    ensure  => $ensure,
    require => [
        Class['mopensuse::zypper::repositories::devel-languages-python']
    ]
  }

  package {'http-prompt':
    ensure  => $ensure,
    require => [
        Class['mopensuse::zypper::repositories::morawskim']
    ]
  }
}