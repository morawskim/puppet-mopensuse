class mopensuse::packages::phpldapadmin {

    include mopensuse::zypper::repositories::morawskim
    include mopensuse::packages::apache2
    include mopensuse::packages::php

    package {'phpldapadmin':
        ensure  => present,
        require => [ 
            Class['mopensuse::zypper::repositories::morawskim'],
            Class['mopensuse::packages::apache2'],
            Class['mopensuse::packages::php']
        ]
    }

    file { "/srv/www/htdocs/phpldapadmin/config/config.php":
        ensure  => link,
        target  => "/srv/www/htdocs/phpldapadmin/config/config.php.example",
        require => Package['phpldapadmin']
    }
}