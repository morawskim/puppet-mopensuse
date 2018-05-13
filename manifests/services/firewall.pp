class mopensuse::services::firewall {
  include mopensuse::packages::firewall

  service { 'SuSEfirewall2':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    require    => Class['mopensuse::packages::firewall'],
  }
}
