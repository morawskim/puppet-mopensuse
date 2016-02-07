class mopensuse::packages::cups {
  
  package {'cups':
    ensure => present
  }
  
  service {'cups':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    require    => [ Package['cups'] ]
  }
  
}