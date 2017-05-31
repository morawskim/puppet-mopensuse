class mopensuse::packages::powerline($ensure = 'present') {

    include mopensuse::zypper::repositories::utilities

    package {'powerline':
        ensure  => $ensure,
        require => Class['mopensuse::zypper::repositories::utilities']
    }
}