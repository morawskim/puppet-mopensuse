class mopensuse::services::php56v {
  include mopensuse::packages::php56v

  service { 'php56v-fpm':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    require    => Class['mopensuse::packages::php56v']
  }
}
