class mopensuse::packages::fbcat {

    include mopensuse::zypper::repositories::utilities

    package {'fbcat':
        ensure  => present,
        require => Class['mopensuse::zypper::repositories::utilities']
    }
}
