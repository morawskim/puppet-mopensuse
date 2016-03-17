class mopensuse::packages::php-dev-scripts (
  $github_oauth_token
) {
  
  include mopensuse::zypper::repositories::morawskim
  
  package {'php-development-scripts':
    ensure  => present,
    require => Class['mopensuse::zypper::repositories::morawskim']
  }

  exec {'install_yuml-php':
    command => 'yuml-php.sh',
    onlyif  => 'test ! -e /usr/local/bin/phpyuml',
    path    => ['/usr/sbin', '/usr/bin', '/bin'],
    require => [ Package['php-development-scripts'], Package['php5-phar'] ]
  }
  
  exec {'install_phpstorm':
    command => 'phpstorm.sh',
    onlyif  => 'test ! -d /opt/PhpStorm/',
    path    => ['/usr/sbin', '/usr/bin', '/bin'],
    timeout => 1200,
    require => [ Package['php-development-scripts'] ]
  }
}