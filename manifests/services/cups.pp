class mopensuse::services::cups {
  include mopensuse::packages::cups

  service { 'cups':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    require    => Class['mopensuse::packages::cups'],
  }
}
