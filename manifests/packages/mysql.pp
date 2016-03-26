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
  
  package {['mariadb', 'mariadb-errormessages', 'mariadb-client']:
    ensure => present
  }
  
  class { '::mysql::server':
    create_root_user        => true,
    package_manage          => false,
    service_manage          => true, #must be true
    root_password           => $mysql_root_password,
    remove_default_accounts => true,
    includedir              => '/etc/my.cnf.d',
    purge_conf_dir          => false,
    require                 => Package['mariadb']
  }
  
  class { '::mysql::client':
    package_ensure => present,
    package_name   => 'mariadb-tools',
  }

  file {'/etc/my.cnf.d/log_query.cnf':
    ensure  => present,
    mode    => '0640',
    owner   => 'root',
    group   => 'mysql',
    content => template("${module_name}/mysql/log_query.cnf.erb"),
    notify  => Service['mysql'],
    require => Package['mariadb']
  }
}