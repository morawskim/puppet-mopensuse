class mopensuse::packages::colout {
    
    include mopensuse::zypper::repositories::utilities
    
    package {'colout':
        ensure  => present,
        require => Class['mopensuse::zypper::repositories::utilities']
    }
    
}