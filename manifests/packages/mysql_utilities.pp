class mopensuse::packages::mysql_utilities($ensure = 'present') {

  include mopensuse::zypper::repositories::server_database

  package {['mysql-utilities']:
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::server_database']
  }
}