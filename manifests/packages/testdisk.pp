class mopensuse::packages::testdisk (
  $ensure = 'present'
) {

  package { 'testdisk':
    ensure => $ensure,
  }
}
