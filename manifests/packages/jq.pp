class mopensuse::packages::jq($ensure = 'present') {

    include mopensuse::zypper::repositories::utilities
    include mopensuse::packages::pygments

    package {'jq':
        ensure  => $ensure,
        require => Class['mopensuse::zypper::repositories::utilities']
    }
}