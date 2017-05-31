class mopensuse::packages::xvfb($ensure = 'present') {

    include mopensuse::packages::xwud

    package {'xvfb-run':
        ensure => $ensure,
    }

}