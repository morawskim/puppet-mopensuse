class mopensuse::services::php54v {
  include mopensuse::packages::php54v

  service { 'php54v-fpm':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    require    => Class['mopensuse::packages::php54v']
  }
}
