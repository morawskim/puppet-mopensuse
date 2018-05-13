class mopensuse::packages::mysql_bench (
  $ensure       = 'present',
  $package_name = 'mariadb-bench'
) {
  include mopensuse::zypper::repositories::server_database

  package { $package_name:
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::server_database']
  }
}
