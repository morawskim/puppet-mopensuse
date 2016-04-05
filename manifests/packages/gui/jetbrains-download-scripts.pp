class mopensuse::packages::gui::jetbrains-download-scripts {
    
    include mopensuse::zypper::repositories::morawskim
    
    package {'jetbrains-download-scripts':
        ensure  => present,
        require => [
            Class['mopensuse::packages::wget'],
            Class['mopensuse::zypper::repositories::morawskim']
        ]
    }
    
}

