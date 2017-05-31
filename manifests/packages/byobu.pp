class mopensuse::packages::byobu($ensure = 'present') {

    include mopensuse::zypper::repositories::utilities

    package {'byobu':
        ensure  => $ensure,
        require => Class['mopensuse::zypper::repositories::utilities']
    }
}