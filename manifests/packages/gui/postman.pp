class mopensuse::packages::gui::postman {

    include mopensuse::zypper::repositories::morawskim

    package {'Postman':
        ensure  => present,
        require => Class['mopensuse::zypper::repositories::morawskim']
    }
}

