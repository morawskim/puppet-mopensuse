class mopensuse::packages::pv {

    include mopensuse::zypper::repositories::utilities

    package {'pv':
        ensure  => present,
        require => Class['mopensuse::zypper::repositories::utilities']
    }
}