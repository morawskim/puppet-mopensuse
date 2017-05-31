class mopensuse::packages::dockerize($ensure = 'present') {

    include mopensuse::zypper::repositories::morawskim
    include mopensuse::zypper::repositories::devel-languages-python

    package {'dockerize':
        ensure  => $ensure,
        require => [
          Class['mopensuse::zypper::repositories::morawskim'],
          Class['mopensuse::zypper::repositories::devel-languages-python']
        ]
    }
}
