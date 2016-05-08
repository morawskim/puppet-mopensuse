class mopensuse::packages::dbus {
    
    include mopensuse::packages::libqt4
    
    package {'dbus-1':
        ensure => present
    }
    
}