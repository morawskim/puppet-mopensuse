class mopensuse::packages::gui::clion {
    
    exec {'install clion':
        command => 'install-clion',
        onlyif  => 'test ! -d /opt/Clion/',
        path    => ['/usr/sbin', '/usr/bin', '/bin'],
        timeout => 1800,
        require => [ Class['mopensuse::packages::gui::jetbrains-download-scripts'] ]
    }
    
}

