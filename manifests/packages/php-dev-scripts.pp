class mopensuse::packages::php-dev-scripts (
  $github_oauth_token
) {
  
  include mopensuse::zypper::repositories::morawskim
  
  package {'php-development-scripts':
    ensure  => present,
    require => Class['mopensuse::zypper::repositories::morawskim']
  }
  
  exec {'install_composer':
    command => 'composer.sh',
    onlyif  => 'test ! -e /usr/local/bin/composer',
    path    => ['/usr/sbin', '/usr/bin', '/bin'],
    require => [ Package['php-development-scripts'], Package['php5-phar'] ]
  }
  
  exec {'install_phing':
    command => 'phing.sh',
    onlyif  => 'test ! -e /usr/local/bin/phing',
    path    => ['/usr/sbin', '/usr/bin', '/bin'],
    require => [ Package['php-development-scripts'], Package['php5-phar'] ]
  }
  
  exec {'install_phpdoc':
    command => 'phpdoc.sh',
    onlyif  => 'test ! -e /usr/local/bin/phpdoc',
    path    => ['/usr/sbin', '/usr/bin', '/bin'],
    require => [ Package['php-development-scripts'], Package['php5-phar'] ]
  }
  
  exec {'install_phpunit':
    command => 'phpunit.sh',
    onlyif  => 'test ! -e /usr/local/bin/phpunit',
    path    => ['/usr/sbin', '/usr/bin', '/bin'],
    require => [ Package['php-development-scripts'], Package['php5-phar'] ]
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
  
  exec {'composer_github_token':
    command     => "composer config --global github-oauth.github.com '$github_oauth_token'",
    user        => 'marcin',
    environment => ['HOME=/home/marcin'],
    unless      => 'test -f /home/marcin/.composer/auth.json',
    path        => ['/bin', '/usr/bin', '/usr/local/bin/'],
    #require     => [ Exec['install_composer'], Mcommon::Account['marcin'] ]
  }
}