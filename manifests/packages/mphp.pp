class mopensuse::packages::mphp {

  include mopensuse::zypper::repositories::morawskim
  include mopensuse::packages::php

  augeas { "/files/etc/environment/PHP_VERSIONS":
    changes => [
      'set /files/etc/environment/PHP_VERSIONS \'"/opt/php"\'',
    ],
    require => [ Package["augeas"] ]
  }

  package {'mphp-switcher':
    ensure  => present,
    require => [
        Class['mopensuse::zypper::repositories::morawskim'],
        Class['mopensuse::packages::php']
    ]
  }

  file {'/opt/php/php/etc/php5':
    ensure  => link,
    target  => "/etc/php5",
    require => Package['mphp-switcher']
  }

  file {'/opt/php/php/usr/bin/php':
      ensure  => link,
      target  => "/usr/bin/php",
      require => Package['mphp-switcher']
  }

  file {'/opt/php/php/usr/bin/php-config':
      ensure  => link,
      target  => "/usr/bin/php-config",
      require => Package['mphp-switcher']
  }

}