class mopensuse::packages::dockerize {

    include mopensuse::zypper::repositories::morawskim

    package {'dockerize':
        ensure  => present,
        require => Class['mopensuse::zypper::repositories::morawskim']
    }
}