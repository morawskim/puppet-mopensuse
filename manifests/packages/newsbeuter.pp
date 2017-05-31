class mopensuse::packages::newsbeuter($ensure = 'present') {

  package {['newsbeuter']:
    ensure => $ensure,
  }
}