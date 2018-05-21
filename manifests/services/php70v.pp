class mopensuse::services::php70v {
  include mopensuse::packages::php70v

  service { 'php70v-fpm':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    require    => Class['mopensuse::packages::php70v']
  }
}
