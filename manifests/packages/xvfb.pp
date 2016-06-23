class mopensuse::packages::xvfb {

    include mopensuse::packages::xwud

    package {'xvfb-run':
        ensure => present
    }

}