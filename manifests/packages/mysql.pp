class mopensuse::packages::mysql(
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
  
  package {['mariadb']:
    ensure => present
  }
  
  class { '::mysql::server':
    create_root_user        => true,
    package_manage          => false,
    service_manage          => true, #must be true
    root_password           => $mysql_root_password,
    remove_default_accounts => true,
    require                 => Package['mariadb']
  }
  
  class { '::mysql::client':
    package_ensure => present,
    package_name   => 'mariadb-tools',
  }
}