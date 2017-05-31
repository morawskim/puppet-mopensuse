class mopensuse::packages::alien($ensure = 'present') {

    include mopensuse::zypper::repositories::utilities

    package {'alien':
        ensure  => $ensure,
        require => Class['mopensuse::zypper::repositories::utilities']
    }
}