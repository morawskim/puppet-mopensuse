class mopensuse::packages::taskwarrior {

    include mopensuse::zypper::repositories::utilities

    package {'taskwarrior':
        ensure  => present,
        require => Class['mopensuse::zypper::repositories::utilities']
    }
}