class mopensuse::services::firewall {
  include mopensuse::packages::firewall

  service { 'firewalld':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    require    => Class['mopensuse::packages::firewall'],
  }
}
