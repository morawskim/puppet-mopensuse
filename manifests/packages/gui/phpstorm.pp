class mopensuse::packages::gui::phpstorm {
    
    exec {'install phpstorm':
        command => 'install-phpstorm',
        onlyif  => 'test ! -d /opt/PhpStorm/',
        path    => ['/usr/sbin', '/usr/bin', '/bin'],
        timeout => 1800,
        require => [ Class['mopensuse::packages::gui::jetbrains-download-scripts'] ]
    }
    
}

