class mopensuse::packages::gui::zeal {

    include mopensuse::zypper::repositories::devel_tools

    package {'zeal':
        ensure  => present,
        require => Zypprepo['devel_tools']
    }
}