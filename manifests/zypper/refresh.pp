class mopensuse::zypper::refresh {
    
  exec {"zypper refresh":
    command => '/usr/bin/zypper refresh'
  }
}
