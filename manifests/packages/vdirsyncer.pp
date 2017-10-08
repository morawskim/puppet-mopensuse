class mopensuse::packages::vdirsyncer($ensure = 'present') {

    include mopensuse::zypper::repositories::devel_languages_python

    package {'vdirsyncer':
        ensure  => $ensure,
        require => Class['mopensuse::zypper::repositories::devel_languages_python']
    }
}
