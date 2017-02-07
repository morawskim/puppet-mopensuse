class mopensuse::packages::memcached {

  include mopensuse::zypper::repositories::server_php_extensions

  package {'memcached':
    ensure => present,
    require => Class['mopensuse::zypper::repositories::server_php_extensions'],
  }
}