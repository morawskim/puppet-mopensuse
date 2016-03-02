class mopensuse::packages::logwatch {
  
  include mopensuse::packages::syslog-ng
  
  package {'logwatch':
    ensure  => present
  }
  
}