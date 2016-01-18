class mopensuse::packages::apache2 {
  
  include mopensuse::firewall 
 
  package {['apache2']:
    ensure => present
  }
  
  service {'apache2':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    require    => Package['apache2']
  }
  
  exec {'disable_apache_mod_php5':
    command => 'a2enmod -d php5',
    onlyif  => 'a2enmod -q php5',
    path    => ['/usr/sbin/'],
    require => Package['apache2'],
    notify  => Service['apache2'] 
  }
  
  
  exec {'enable_apache_mod_proxy':
    command => 'a2enmod proxy',
    unless  => 'a2enmod -q proxy',
    path    => ['/usr/sbin/'],
    require => Package['apache2'],
    notify  => Service['apache2'] 
  }
  
  exec {'enable_apache_mod_ssl':
    command => 'a2enmod ssl',
    unless  => 'a2enmod -q ssl',
    path    => ['/usr/sbin/'],
    require => Package['apache2'],
    notify  => Service['apache2'] 
  }
  
  exec {'enable_apache_mod_rewrite':
    command => 'a2enmod rewrite',
    unless  => 'a2enmod -q rewrite',
    path    => ['/usr/sbin/'],
    require => Package['apache2'],
    notify  => Service['apache2'] 
  }
  
  exec {'enable_apache_mod_proxy_fcgi':
    command => 'a2enmod proxy_fcgi',
    unless  => 'a2enmod -q proxy_fcgi',
    path    => ['/usr/sbin/'],
    require => [ Package['apache2'], Exec['enable_apache_mod_proxy'] ],
    notify  => Service['apache2'] 
  }
  
  exec {'define_apache_ssl_flag':
    command => 'a2enflag SSL',
    path    => ['/usr/sbin/', '/usr/bin', '/bin'],
    unless  => "grep -e '^APACHE_SERVER_FLAGS' /etc/sysconfig/apache2 | grep SSL",
    require => [ Package['apache2'], Exec['enable_apache_mod_ssl'] ],
    notify  => Service['apache2'] 
  }
  
  #firewall http i https
  exec {'firewall_open_http_server_port':
    command => 'sysconf_addwor d/etc/sysconfig/SuSEfirewall2 FW_CONFIGURATIONS_EXT apache2',
    unless  => 'cat /etc/sysconfig/SuSEfirewall2 | grep -E "^\s*FW_CONFIGURATIONS_EXT" | cut -f2 -d= | sed -n \'s/^"\(.*\)"$/\1/p\' | tr -s " " | tr " " "\n" | grep -E "^apache2$"',
    path    => ['/usr/sbin', '/usr/bin'],
    require => [ Package['apache2'], Class['mopensuse::firewall'] ]
  }
  
  exec {'firewall_open_https_server_port':
    command => 'sysconf_addword /etc/sysconfig/SuSEfirewall2 FW_CONFIGURATIONS_EXT apache2-ssl',
    unless  => 'grep "apache2-ssl" /etc/sysconfig/SuSEfirewall2 | grep "FW_CONFIGURATIONS_EXT"',
    path    => ['/usr/sbin', '/usr/bin'],
    require => [ Package['apache2'], Class['mopensuse::firewall'] ]
  }
  
  #vhost templates for php-fpm & ssl-php-fpm
  file {'/etc/apache2/vhosts.d/vhost-fpm.template':
    ensure => present,
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    source  => "puppet:///modules/${module_name}/apache2/vhost-fpm.template",
    require => Package['apache2']
  }
  
  file {'/etc/apache2/vhosts.d/vhost-fpm-ssl.template':
    ensure => present,
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    source  => "puppet:///modules/${module_name}/apache2/vhost-fpm-ssl.template",
    require => Package['apache2']
  }
  
  #vhost dir
  file {'/srv/www/vhosts':
    ensure  => directory,
    mode    => '0755',
    owner   => 'root',
    group   => 'root',
    require => Package['apache2']
  }
  
  #default vhost
  file {'/etc/apache2/vhosts.d/000-default.conf':
    ensure  => present,
    mode    => '0744',
    owner   => 'root',
    group   => 'root',
    source  => 'puppet:///modules/mopensuse/apache2/000-default.vhost',
    require => Package['apache2'],
    notify  => Service['apache2']
  }
}