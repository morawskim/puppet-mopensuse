class mopensuse::packages::openvpn($ensure = 'present') {
  
  package {['openvpn']:
    ensure => $ensure,
  }
  
}