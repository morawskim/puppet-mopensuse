class mopensuse::packages::gui::jetbrains_download_scripts($ensure = 'present') {
    
    include mopensuse::zypper::repositories::morawskim
    
    package {'jetbrains-download-scripts':
        ensure  => $ensure,
        require => [
            Class['mopensuse::packages::wget'],
            Class['mopensuse::zypper::repositories::morawskim']
        ]
    }
    
}

