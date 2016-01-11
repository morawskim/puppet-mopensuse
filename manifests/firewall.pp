class mopensuse::firewall {
  package{'SuSEfirewall2':
	ensure => present
  }
  
  service {'SuSEfirewall2':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    require    => Package['SuSEfirewall2']
  }
}