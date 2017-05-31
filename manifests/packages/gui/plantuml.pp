class mopensuse::packages::gui::plantuml($ensure = 'present') {
    include mopensuse::zypper::repositories::morawskim

    package {'plantuml':
        ensure  => $ensure,
        require => [
            Class['mopensuse::zypper::repositories::morawskim']
        ]
    } 
}

