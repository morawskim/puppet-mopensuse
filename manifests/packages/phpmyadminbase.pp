class mopensuse::packages::phpmyadminbase {

  class { '::phpmyadmin':
    manage_apache   => false,
    manage_config   => false,
    preseed_package => false
  }
}
