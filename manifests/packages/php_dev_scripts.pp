class mopensuse::packages::php_dev_scripts(
  $ensure = 'present',
  $github_oauth_token
) {
  
  include mopensuse::zypper::repositories::morawskim
  
  package {'php-development-scripts':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::morawskim']
  }

  exec {'install_yuml-php':
    command => 'yuml-php.sh',
    onlyif  => 'test ! -e /usr/local/bin/phpyuml',
    path    => ['/usr/sbin', '/usr/bin', '/bin'],
    require => [ Package['php-development-scripts'], Package['php5-phar'] ]
  }

}
