class mopensuse::packages::quilt (
  $ensure = 'present'
) {

  package { 'quilt':
    ensure => $ensure,
  }
}
