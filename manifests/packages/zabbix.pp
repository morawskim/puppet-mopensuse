class mopensuse::packages::zabbix(
  $zabbix_server_db_name,
  $zabbix_server_db_user,
  $zabbix_server_db_pass
) {
  
  #zabbix group and user also create zabbix-agent package
  user { 'zabbix':
    ensure  => 'present',
    comment => 'Zabbix Agent Daemon',
    home    => '/var/lib/zabbix',
    shell   => '/bin/false',
    system  => true,
    gid     => 'zabbix',
    before  => Class['::zabbix'],
    require => Group['zabbix']
  }

  group { 'zabbix':
    ensure  => 'present',
    system     => true,
    before  => [ Class['::zabbix'], User['zabbix'] ]
  }

  class { '::zabbix':
    zabbix_url        => 'zabbix.dev',
    database_type     => 'mysql',
    manage_repo       => false,
    manage_firewall   => false,
    manage_vhost      => false,
    pidfile           => '/run/zabbixs/zabbix-server.pid',
    logfile           => '/var/log/zabbixs/zabbix-server.log',
    zabbix_version    => '2.2',
    database_name     => $zabbix_server_db_name,
    database_user     => $zabbix_server_db_user,
    database_password => $zabbix_server_db_pass
  }

  host {'zabbix.dev':
    ensure       => present,
    ip           => '127.0.0.1',
    host_aliases => ['www.zabbix.dev'],
    require => Class['::zabbix'],
  }

  file {'/etc/apache2/vhosts.d/zabbix.dev.conf':
    ensure  => present,
    mode    => '0744',
    owner   => 'root',
    group   => 'root',
    source  => 'puppet:///modules/mopensuse/zabbix/vhost.conf',
    require => Class['::zabbix'],
    notify  => Service['apache2']
  }
  
  file {'/usr/share/zabbix/conf/zabbix.conf.php':
    ensure  => present,
    mode    => '0640',
    owner   => 'root',
    group   => 'www',
    content => template("${module_name}/zabbix/zabbix.conf.php.erb"),
    require => Class['::zabbix'],
    notify  => Service['zabbix-server']
  }
}