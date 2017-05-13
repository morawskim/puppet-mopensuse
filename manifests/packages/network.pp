class mopensuse::packages::network {

  package {['nmap', 'ipcalc']:
    ensure => present
  }
}