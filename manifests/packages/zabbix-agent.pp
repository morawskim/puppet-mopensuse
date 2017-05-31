class mopensuse::packages::zabbix-agent($ensure = 'present') {
  
  class { '::zabbix::agent':
    manage_repo => false,
    manage_firewall => false,
    zabbix_version => '2.2',
    manage_resources => false,
    pidfile => '/run/zabbix/zabbix-agentd.pid',
    logfile => '/var/log/zabbix/zabbix-agentd.log',
  }
}