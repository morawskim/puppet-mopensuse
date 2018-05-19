class mopensuse::services::redis {
  include mopensuse::packages::redis

  service { 'redis@default':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    require    => [ Class['mopensuse::packages::redis'] ],
  }
}
