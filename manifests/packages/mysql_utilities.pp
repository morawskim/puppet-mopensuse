class mopensuse::packages::mysql_utilities {

  include mopensuse::zypper::repositories::server_database

  package {['mysql-utilities']:
    ensure  => present,
    require => Class['mopensuse::zypper::repositories::server_database']
  }
}