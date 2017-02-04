class mopensuse::packages::gui::jetbrains_toolbox {

    include mopensuse::zypper::repositories::morawskim

    package {'jetbrains-toolbox':
        ensure  => present,
        require => Class['mopensuse::zypper::repositories::morawskim']
    }
}

