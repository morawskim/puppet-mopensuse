class mopensuse::packages::gui::plantuml {
    include mopensuse::zypper::repositories::morawskim

    package {'plantuml':
        ensure  => present,
        require => [
            Class['mopensuse::zypper::repositories::morawskim']
        ]
    } 
}

