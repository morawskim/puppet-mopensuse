class mopensuse::services::php55v {
  include mopensuse::packages::php55v

  service { 'php55v-fpm':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    require    => Class['mopensuse::packages::php55v']
  }
}
