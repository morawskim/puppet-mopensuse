class mopensuse::packages::bsdtar (
  $ensure = 'present'
) {

  package { 'bsdtar':
    ensure => $ensure,
  }
}
