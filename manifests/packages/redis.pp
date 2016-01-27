class mopensuse::packages::redis {
  
  package {'redis':
    ensure => present
  }
  
  file {'/etc/redis/bin.conf':
    ensure  => present,
    mode    => '0640',
    owner   => 'redis',
    group   => 'redis',
    source  => "puppet:///modules/${module_name}/redis/bin.conf",
    notify  => [ Service['redis'] ],
    require => Package['redis']
  }
  
  file {'/etc/bash_completion.d/redis.sh':
    ensure  => present,
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    source  => "puppet:///modules/${module_name}/redis/bash_completion.sh"
  }
  
  service {'redis':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    require    => [ Package['redis'], File['/etc/redis/bin.conf'] ]
  }
  
}