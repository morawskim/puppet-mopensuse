class mopensuse::packages::selenium(
    $chromedrive_path
) {

    include mopensuse::zypper::repositories::morawskim
    include mopensuse::packages::xvfb
    include mopensuse::packages::augeas

    augeas { "/files/etc/sysconfig/selenium/SELENIUM_ARGS":
        changes => [
        "set /files/etc/sysconfig/selenium/SELENIUM_ARGS '\"-Dwebdriver.chrome.driver=$chromedrive_path\"'",
        ],
        require => [ Class["mopensuse::packages::augeas"], Package['selenium'] ],
        notify  => Service['selenium']
    }

    service {'selenium':
        ensure     => running,
        enable     => true,
        hasrestart => true,
        hasstatus  => true,
        require    => Package['selenium']
    }

    package {['selenium', 'selenium-chromedriver']:
        ensure  => present,
        require => [
            Class['mopensuse::zypper::repositories::morawskim'],
            Class['mopensuse::packages::xvfb']
        ]
    } 
}
