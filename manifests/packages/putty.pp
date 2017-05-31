class mopensuse::packages::putty($ensure = 'present') {

  package {['putty']:
    ensure => $ensure,
  }
}