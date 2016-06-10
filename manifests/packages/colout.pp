class mopensuse::packages::colout {
    
    include mopensuse::zypper::repositories::utilities
    include mopensuse::packages::pygments
    
    package {'colout':
        ensure  => present,
        require => Class['mopensuse::zypper::repositories::utilities']
    }
    
}