class mopensuse::packages::php_docs($ensure = 'present') {

  include mopensuse::zypper::repositories::morawskim

  package {'php-docs':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::morawskim']
  }
}
