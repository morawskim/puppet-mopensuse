class mopensuse::packages::gui::adobe_source_code_pro_fonts {

    include mopensuse::zypper::repositories::morawskim

    package { 'adobe-source-code-pro-fonts':
        ensure  => present,
        require => Class['mopensuse::zypper::repositories::morawskim']
    }
}