class mopensuse::config::redis {
  include mopensuse::packages::redis
  include mopensuse::services::redis

  file { '/etc/redis/default.conf':
    ensure  => present,
    mode    => '0640',
    owner   => 'redis',
    group   => 'redis',
    source  => 'file:///etc/redis/default.conf.example',
    notify  => Class['mopensuse::services::redis'],
    require => Class['mopensuse::packages::redis']
  }
}
