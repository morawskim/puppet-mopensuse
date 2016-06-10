class mopensuse::packages::ttyrec {
    
    include mopensuse::zypper::repositories::utilities
    
    package {'ttyrec':
        ensure  => present,
        require => Class['mopensuse::zypper::repositories::utilities']
    }
    
}