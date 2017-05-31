class mopensuse::packages::whois($ensure = 'present') {
  
  package {'whois':
    ensure => $ensure,
  }
  
}