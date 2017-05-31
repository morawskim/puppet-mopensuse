class mopensuse::packages::fbcat($ensure = 'present') {

    include mopensuse::zypper::repositories::utilities

    package {'fbcat':
        ensure  => $ensure,
        require => Class['mopensuse::zypper::repositories::utilities']
    }
}
