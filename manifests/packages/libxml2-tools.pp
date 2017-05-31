class mopensuse::packages::libxml2-tools($ensure = 'present') {
    
    package {'libxml2-tools':
        ensure  => $ensure,
    }
    
}