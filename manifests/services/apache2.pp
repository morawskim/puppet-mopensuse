class mopensuse::services::apache2 {

  include mopensuse::packages::apache2

  service {'apache2':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    require    => Class['mopensuse::packages::apache2'],
  }
}
