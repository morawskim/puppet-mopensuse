class mopensuse::packages::httpie {

  include mopensuse::zypper::repositories::devel-languages-python

  package {'httpie':
    ensure  => present,
    require => [
        Class['mopensuse::zypper::repositories::devel-languages-python']
    ]
  }
}