class mopensuse::packages::fontawesome {

    include mopensuse::zypper::repositories::morawskim

    package {['fontawesome-fonts', 'fontawesome-fonts-web']:
        ensure  => present,
        require => Class['mopensuse::zypper::repositories::morawskim']
    }

}