class mopensuse::packages::gui::xrectsel {

    include mopensuse::zypper::repositories::morawskim

    package { 'xrectsel':
        ensure  => present,
        require => Class['mopensuse::zypper::repositories::morawskim']
    }
}