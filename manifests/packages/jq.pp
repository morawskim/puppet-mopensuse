class mopensuse::packages::jq {

    include mopensuse::zypper::repositories::utilities
    include mopensuse::packages::pygments

    package {'jq':
        ensure  => present,
        require => Class['mopensuse::zypper::repositories::utilities']
    }
}