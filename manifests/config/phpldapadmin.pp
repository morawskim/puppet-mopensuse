class mopensuse::config::phpldapadmin {
  include mopensuse::packages::phpldapadmin

  file { '/srv/www/htdocs/phpldapadmin/config/config.php':
    ensure  => link,
    target  => '/srv/www/htdocs/phpldapadmin/config/config.php.example',
    require => Class['mopensuse::packages::phpldapadmin']
  }
}
