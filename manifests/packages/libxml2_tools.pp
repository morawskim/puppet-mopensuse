class mopensuse::packages::libxml2_tools($ensure = 'present') {
    
    package {'libxml2-tools':
        ensure  => $ensure,
    }
    
}
