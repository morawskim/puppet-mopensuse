class mopensuse::packages::bind_utils($ensure = 'present') {
    
    package {'bind-utils':
        ensure => $ensure,
    }
    
}
