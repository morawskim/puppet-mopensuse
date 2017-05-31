class mopensuse::packages::highlight($ensure = 'present') {
    
    include mopensuse::zypper::repositories::devel_tools
    
    package {'highlight':
        ensure  => $ensure,
        require => Zypprepo['devel_tools']
    }
    
}