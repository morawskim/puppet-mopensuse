class mopensuse::packages::httpry() {

    include mopensuse::zypper::repositories::network_utilities

    package {'httpry':
        ensure  => present,
        require => Class['mopensuse::zypper::repositories::network_utilities']
    }
}
