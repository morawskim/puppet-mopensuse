class mopensuse::services::selenium {
  include mopensuse::packages::selenium

  service { 'selenium':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    require    => Class['mopensuse::packages::selenium'],
  }
}
