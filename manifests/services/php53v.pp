class mopensuse::services::php53v {
  include mopensuse::packages::php53v

  service { 'php53v-fpm':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    require    => Class['mopensuse::packages::php53v']
  }
}
