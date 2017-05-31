class mopensuse::packages::vdirsyncer($ensure = 'present') {

    include mopensuse::zypper::repositories::devel-languages-python

    package {'vdirsyncer':
        ensure  => $ensure,
        require => Class['mopensuse::zypper::repositories::devel-languages-python']
    }
}
