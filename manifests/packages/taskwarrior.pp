class mopensuse::packages::taskwarrior($ensure = 'present') {

    include mopensuse::zypper::repositories::utilities

    package {'taskwarrior':
        ensure  => $ensure,
        require => Class['mopensuse::zypper::repositories::utilities']
    }
}