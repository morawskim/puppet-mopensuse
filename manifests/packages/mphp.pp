class mopensuse::packages::mphp {
  
  include mopensuse::zypper::repositories::morawskim
  
  augeas { "/files/etc/environment/PHP_VERSIONS":
    changes => [
      'set /files/etc/environment/PHP_VERSIONS \'"/opt/php"\'',
    ],
    require => [ Package["augeas"] ]
  }
    
  package {'mphp-switcher':
    ensure  => present,
    require => Class['mopensuse::zypper::repositories::morawskim']
  }
}