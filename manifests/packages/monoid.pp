class mopensuse::packages::monoid {

    include mopensuse::zypper::repositories::morawskim

    package { 'monoid':
        ensure  => present,
        require => Class['mopensuse::zypper::repositories::morawskim']
    }

}