class mopensuse::packages::tig($ensure = 'present') {

  package {['tig']:
    ensure => $ensure,
  }
}