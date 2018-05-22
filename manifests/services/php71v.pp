class mopensuse::services::php71v {
  include mopensuse::packages::php71v

  service { 'php71v-fpm':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    require    => Class['mopensuse::packages::php71v']
  }
}
