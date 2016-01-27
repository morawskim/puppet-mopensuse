class mopensuse::packages::gettext {
  
  package {['gettext-tools', 'gettext-runtime']:
    ensure => present
  }
  
}