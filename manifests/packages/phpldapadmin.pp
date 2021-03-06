class mopensuse::packages::phpldapadmin (
  $ensure = 'present'
) {
  include mopensuse::zypper::repositories::morawskim
  include mopensuse::packages::apache2
  include mopensuse::packages::php

  package { 'phpldapadmin':
    ensure  => $ensure,
    require => [
      Class['mopensuse::zypper::repositories::morawskim'],
      Class['mopensuse::packages::apache2'],
      Class['mopensuse::packages::php']
    ]
  }
}
