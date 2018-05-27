class mopensuse::packages::phpmyadmin40 (
  $ensure = 'present'
) {
  include mopensuse::packages::phpmyadminbase
  include mopensuse::zypper::repositories::morawskim

  package { 'phpMyAdmin40':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::morawskim']
  }
}
