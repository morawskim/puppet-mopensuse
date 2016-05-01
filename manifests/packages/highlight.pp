class mopensuse::packages::highlight {
    
    include mopensuse::zypper::repositories::devel_tools
    
    package {'highlight':
        ensure  => present,
        require => Zypprepo['devel_tools']
    }
    
}