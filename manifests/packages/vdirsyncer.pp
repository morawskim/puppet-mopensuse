class mopensuse::packages::vdirsyncer {

    include mopensuse::zypper::repositories::devel-languages-python

    package {'vdirsyncer':
        ensure  => present,
        require => Class['mopensuse::zypper::repositories::devel-languages-python']
    }
}
