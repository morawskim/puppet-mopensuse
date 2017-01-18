class mopensuse::packages::gui::telegram {

    include mopensuse::zypper::repositories::morawskim

    package {'telegram-desktop':
        ensure  => present,
        require => Class['mopensuse::zypper::repositories::morawskim']
    }
}

