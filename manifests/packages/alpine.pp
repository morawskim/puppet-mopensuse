class mopensuse::packages::alpine($ensure = 'present') {

  package {['alpine']:
    ensure => $ensure,
  }
}