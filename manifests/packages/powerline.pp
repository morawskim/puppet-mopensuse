class mopensuse::packages::powerline {

    include mopensuse::zypper::repositories::utilities

    package {'powerline':
        ensure  => present,
        require => Class['mopensuse::zypper::repositories::utilities']
    }
}