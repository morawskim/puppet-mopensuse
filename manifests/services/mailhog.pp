class mopensuse::services::mailhog {
  include mopensuse::packages::mailhog

  service { 'mailhog':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    require    => Class['mopensuse::packages::mailhog'],
  }
}
