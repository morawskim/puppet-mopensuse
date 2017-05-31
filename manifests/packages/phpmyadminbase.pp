class mopensuse::packages::phpmyadminbase($ensure = 'present') {

  class { '::phpmyadmin':
    manage_apache   => false,
    manage_config   => false,
    preseed_package => false
  }
}
