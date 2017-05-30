class mopensuse::packages::redis {

  if $::operatingsystemrelease > 13.2 {
    $servicename = 'redis@default'
  } else {
    $servicename = 'redis'
  }

  package {'redis':
    ensure => present
  }

  file {'/etc/redis/default.conf':
    ensure  => present,
    mode    => '0640',
    owner   => 'redis',
    group   => 'redis',
    source  => "file:///etc/redis/default.conf.example",
    notify  => [ Service[$servicename] ],
    require => Package['redis']
  }

  file {'/etc/bash_completion.d/redis.sh':
    ensure  => present,
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    source  => "puppet:///modules/${module_name}/redis/bash_completion.sh"
  }

  service {$servicename:
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    require    => [ Package['redis'], File['/etc/redis/default.conf'] ]
  }
}
