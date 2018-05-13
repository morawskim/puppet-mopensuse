class mopensuse::packages::createrepo (
  $ensure = 'present'
) {

  package { 'createrepo':
    ensure => $ensure,
  }
}
