class mopensuse::packages::gui::clion($ensure = 'present') {
    
    exec {'install clion':
        command => 'install-clion',
        onlyif  => 'test ! -d /opt/Clion/',
        path    => ['/usr/sbin', '/usr/bin', '/bin'],
        timeout => 1800,
        require => [ Class['mopensuse::packages::gui::jetbrains_download_scripts'] ]
    }
    
}

