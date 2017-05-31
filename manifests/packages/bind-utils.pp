class mopensuse::packages::bind-utils($ensure = 'present') {
    
    package {'bind-utils':
        ensure => $ensure,
    }
    
}