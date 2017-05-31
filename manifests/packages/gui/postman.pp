class mopensuse::packages::gui::postman($ensure = 'present') {

    include mopensuse::zypper::repositories::morawskim

    package {'Postman':
        ensure  => $ensure,
        require => Class['mopensuse::zypper::repositories::morawskim']
    }
}

