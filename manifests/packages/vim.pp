class mopensuse::packages::vim (
  $ensure = 'present'
) {

  package { 'vim':
    ensure => $ensure,
  }
}
