class mopensuse::packages::byobu {

    include mopensuse::zypper::repositories::utilities

    package {'byobu':
        ensure  => present,
        require => Class['mopensuse::zypper::repositories::utilities']
    }
}