class mopensuse::packages::memcached($ensure = 'present') {

  include mopensuse::zypper::repositories::server_php_extensions

  package {'memcached':
    ensure => $ensure,
    require => Class['mopensuse::zypper::repositories::server_php_extensions'],
  }
}