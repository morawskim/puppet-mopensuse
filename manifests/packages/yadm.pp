class mopensuse::packages::yadm($ensure = 'present') {

    include mopensuse::zypper::repositories::morawskim

    package {'yadm':
        ensure  => $ensure,
        require => Class['mopensuse::zypper::repositories::morawskim']
    }
}