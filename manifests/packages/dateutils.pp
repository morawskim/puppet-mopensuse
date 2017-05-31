class mopensuse::packages::dateutils($ensure = 'present') {
    
    include mopensuse::zypper::repositories::utilities
    
    package {'dateutils':
        ensure  => $ensure,
        require => Class['mopensuse::zypper::repositories::utilities']
    }
    
}