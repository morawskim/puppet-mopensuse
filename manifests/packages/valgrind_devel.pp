class mopensuse::packages::valgrind_devel (
  $ensure = 'present'
) {

  package { 'valgrind-devel':
    ensure => present
  }
}
