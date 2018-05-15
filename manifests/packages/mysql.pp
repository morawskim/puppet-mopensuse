class mopensuse::packages::mysql (
  $ensure = 'present',
  $mysql_root_password
) {

  #must be commented
  #service {'mysql':
  #  ensure     => running,
  #  enable     => true,
  #  hasrestart => true,
  #  hasstatus  => true,
  #  require    => Package['mariadb']
  #}

  package { ['mariadb', 'mariadb-errormessages', 'mariadb-client']:
    ensure => $ensure,
  }

  class { '::mysql::server':
    create_root_user        => true,
    package_manage          => false,
    service_manage          => true, #must be true
    root_password           => $mysql_root_password,
    remove_default_accounts => true,
    includedir              => '/etc/my.cnf.d',
    purge_conf_dir          => false,
    manage_config_file      => false,
    root_group              => 'mysql',
    require                 => Package['mariadb']
  }

  class { '::mysql::client':
    package_ensure => present,
    package_name   => 'mariadb-tools',
  }
}
