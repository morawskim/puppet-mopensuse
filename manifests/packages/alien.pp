class mopensuse::packages::alien {

    include mopensuse::zypper::repositories::utilities

    package {'alien':
        ensure  => present,
        require => Class['mopensuse::zypper::repositories::utilities']
    }
}