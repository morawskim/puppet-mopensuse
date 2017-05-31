class mopensuse::packages::colout($ensure = 'present') {
    
    include mopensuse::zypper::repositories::utilities
    include mopensuse::packages::pygments
    
    package {'colout':
        ensure  => $ensure,
        require => Class['mopensuse::zypper::repositories::utilities']
    }
    
}