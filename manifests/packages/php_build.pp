class mopensuse::packages::php_build (
  $ensure = 'present'
) {
  include mopensuse::zypper::repositories::morawskim

  package { 'php-build':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::morawskim']
  }
}
