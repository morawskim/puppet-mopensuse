class mopensuse::packages::gui::libqt4_x11($ensure = 'present') {
    
    # This package provide qdbusviewer
    package {'libqt4-x11':
        ensure => $ensure,
    }
    
}
