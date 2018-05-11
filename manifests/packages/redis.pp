class mopensuse::packages::redis($ensure = 'present') {

  if $::operatingsystemrelease > 13.2 {
    $servicename = 'redis@default'
  } else {
    $servicename = 'redis'
  }

  package {'redis':
    ensure => $ensure,
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

  service {$servicename:
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    require    => [ Package['redis'], File['/etc/redis/default.conf'] ]
  }
}
