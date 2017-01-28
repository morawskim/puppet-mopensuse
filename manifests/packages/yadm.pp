class mopensuse::packages::yadm {

    include mopensuse::zypper::repositories::morawskim

    package {'yadm':
        ensure  => present,
        require => Class['mopensuse::zypper::repositories::morawskim']
    }
}