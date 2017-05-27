class mopensuse::packages::dockerize {

    include mopensuse::zypper::repositories::morawskim
    include mopensuse::zypper::repositories::devel-languages-python

    package {'dockerize':
        ensure  => present,
        require => [
          Class['mopensuse::zypper::repositories::morawskim'],
          Class['mopensuse::zypper::repositories::devel-languages-python']
        ]
    }
}
