class mopensuse::packages::dateutils {
    
    include mopensuse::zypper::repositories::utilities
    
    package {'dateutils':
        ensure  => present,
        require => Class['mopensuse::zypper::repositories::utilities']
    }
    
}