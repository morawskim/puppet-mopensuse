class mopensuse::packages::gui::rubymine {
    
    exec {'install rubymine':
        command => 'install-rubymine',
        onlyif  => 'test ! -d /opt/RubyMine/',
        path    => ['/usr/sbin', '/usr/bin', '/bin'],
        timeout => 1800,
        require => [ Class['mopensuse::packages::gui::jetbrains-download-scripts'] ]
    }
    
}

