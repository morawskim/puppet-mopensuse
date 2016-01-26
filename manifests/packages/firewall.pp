class mopensuse::packages::firewall {
  
  include mopensuse::services::firewall
  
  package {'SuSEfirewall2':
    ensure => present
  }
  
}