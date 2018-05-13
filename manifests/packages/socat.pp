class mopensuse::packages::socat (
  $ensure = 'present'
) {

  package { 'socat':
    ensure => $ensure,
  }
}
